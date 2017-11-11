NO_COLOR=\033[0m
WHITE_BOLD=\033[1;37m
YELLOW=\033[1;33m
GREEN=\033[32;01m

IMAGE_NAME = dohernandez/$(notdir $(PWD:%/=%))
CONTAINER_NAME = $(PROJECT_NAME)
WORKDIR = /app

VERSION = 3.3

CFLAGS=-g
export CFLAGS

all: usage

usage:
	@echo "Symfony Installer"

	@echo ""

	@echo "$(WHITE_BOLD)USAGE$(NO_COLOR)"

	@echo "\tmake command [arguments]"

	@echo ""

	@echo "$(WHITE_BOLD)COMMANDS$(NO_COLOR)"

	@echo "\tbuild: \t\t\tBuild the docker image for the project."
	@echo "\thelp: \t\t\tSymfony installer help."
	@echo "\tcreate: \t\tCreate a new Symfony project."

	@echo ""

	@echo "$(WHITE_BOLD)SYNOPSIS$(NO_COLOR)"

	@echo "\t$(WHITE_BOLD)build$(NO_COLOR)"

	@echo "\t$(WHITE_BOLD)help$(NO_COLOR)"

	@printf "\t$(WHITE_BOLD)create$(NO_COLOR)"
	@printf "\t[$(WHITE_BOLD)PROJECT_NAME$(NO_COLOR)]"
	@printf " [$(WHITE_BOLD)PROJECT_ROOT_PATH$(NO_COLOR)]"
	@echo " ( [$(WHITE_BOLD)VERSION$(NO_COLOR)] )"

	@echo ""

	@echo "$(WHITE_BOLD)DESCRIPTION$(NO_COLOR)"

	@printf "\t$(WHITE_BOLD)PROJECT_NAME$(NO_COLOR)"
	@echo "\t\tThe name of the project"
	@echo ""
	@printf "\t$(WHITE_BOLD)PROJECT_ROOT_PATH$(NO_COLOR)"
	@echo "\tThe root path of the project"
	@echo ""
	@printf "\t$(WHITE_BOLD)VERSION$(NO_COLOR)"
	@echo "\t\t\tSymfony version. (lts|2.8|3.0|...|3.3) default: $(VERSION)"

build:
	@printf "$(GREEN)==> Building docker $(IMAGE_NAME) image ...$(NO_COLOR)\n"
	@docker build -t $(IMAGE_NAME) .

help:
	@printf "$(GREEN)==> Symfony installer help ...$(NO_COLOR)\n"
	@docker run -it --rm $(IMAGE_NAME)

create:
	@printf "$(GREEN)==> Creating symfony application $(PROJECT_NAME) version: $(VERSION)...$(NO_COLOR)\n"
	@docker run -it --rm -v $(PWD):$(WORKDIR) $(IMAGE_NAME) \
	new $(PROJECT_NAME) $(VERSION)


.PHONY: all usage build help create options