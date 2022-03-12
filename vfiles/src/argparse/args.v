module argparse

import cli

struct Parser {
pub mut:
	name string
	description string
	version string
	args []string
	flags []cli.Flag
	commands []cli.Command
}

pub fn (p Parser) parse() {
	mut args := []string{}

	for i, flag in p.flags {
		
	}
}

pub fn (p Parser) add_flag(flag Flag) {

}

pub fn new_parser(arguments []string) Parser {
	return Parser{args: arguments}
}
