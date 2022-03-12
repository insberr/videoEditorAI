module main

import os
import cli
import os.cmdline
struct Arg {
mut:
	name  string
	value string
}

fn main() {
	f_args := cmdline.only_non_options(os.args[1..])
	flags := cmdline.only_options(os.args[1..])

	mut args := map[string]string
	for i, _ in flags {
		if i >= f_args.len {
			println('Missing args')
			break
		}
		args[flags[i]] = f_args[i]
	}
	println(args)
	
	format := args['--format']

	// fo := cmdline.option(os.args, '-f', cmdline.option(os.args, '--format', 'mp4'))
	println(format)

/*
	args, _ := get_cmd_input()
	if args['help'] == 'true' {
		println('help')
		return
	}
	println('get_cmd_input() => $args')
	format := args['format']
	println(format)
	*/
	// println(comd)
	/*
	flags.add_flag(cli.Flag{
		flag: .string
		name: 'format'
		abbrev: 'f'
		description: 'Format video out'
		value: 'mp4'
	})
	flags.add_flag(cli.Flag{flag: .string name: 'mine' abbrev: 'm'})

	// flags.parse(os.args)

	format := flags.flags.get_string('format') or { return }
	println(format)
	*/ // === "Global" ===
	// working_dir := os.getwd()
	/*
	=== Flags === 
	mut parser := flag.new_flag_parser(os.args)
	println(os.args)

	parser.application('Video Editor AI')
	parser.version('v0.0.0')
	parser.description('Edit videos with as little human interaction as possible')
	parser.skip_executable()

	help := parser.bool('help', `h`, false, 'Show this help message')
	work_dir := parser.string('dir', `d`, working_dir, 'Set the working directory') 
	input_dir := parser.string('input', `i`, work_dir, 'The directory to the folder the video(s) are stored in (The directory is set on the set working directory)')
	output_dir := parser.string('output', `o`, work_dir, 'Output files directory (without a / in front)')
	out_name := parser.string('name', `n`, 'finished_output', 'The name of the finished product')
	video_fmt := parser.string('video_format', `f`, 'mp4', 'Set the output video format\nOptions: mp4, mkv, avi, mov')
	audio_fmt := parser.string('audio_format', `a`, 'wav', 'Set the audio format\nOptions: mp3, m4a, wav, ogg')
	audio_cmb := parser.bool('audio_combine', `c`, false, 'Combine all the audio tracks for each video into one track')

	additional_args := parser.finalize() or {
		eprintln(err)
		println(parser.usage())
		return
	}

	if help == true {
		println(parser.usage())
		return
	}

	println(video.cut_by_silence(work_dir))
	printthings()
	println(get_cmd_input())
	*/
}

fn printthings() {
	println('Thank you for using the auto video editor')
}

fn get_cmd_input() (map[string]string, cli.Command) {
	mut cmd := cli.Command{
		name: 'videoeditor'
		description: 'Video editor with as little human interaction as possible'
		version: 'v0.0.1'
	}

	// Run flags
	cmd.add_flag(cli.Flag{
		flag: .string
		name: 'format'
		abbrev: 'f'
		description: 'Format video out'
		value: 'mp4'
	})
	cmd.add_flag(cli.Flag{
		flag: .string
		name: 'mine'
		abbrev: 'm'
		value: 'no'
	})
	cmd.parse(os.args)
	
	all := cmd.flags.map(Arg{it.name, it.value})
	mut nargs := map[string]string{}
	for arg in all {
		nargs[arg.name] = arg.value
	} // === "Global" ===
	// working_dir := os.getwd()
	return nargs, cmd // cmd.flags, cmd.args
	/*
	working_dir := 'this/'
	mut parser := flag.new_flag_parser(os.args)

	parser.application('Video Editor AI')
	parser.version('v0.0.0')
	parser.description('Edit videos with as little human interaction as possible')
	parser.skip_executable()

	help := parser.bool('help', `h`, false, 'Show this help message')
	work_dir := parser.string('dir', `d`, working_dir, 'Set the working directory') 
	input_dir := parser.string('input', `i`, work_dir, 'The directory to the folder the video(s) are stored in (The directory is set on the set working directory)')
	output_dir := parser.string('output', `o`, work_dir, 'Output files directory (without a / in front)')
	out_name := parser.string('name', `n`, 'finished_output', 'The name of the finished product')
	video_fmt := parser.string('video_format', `f`, 'mp4', 'Set the output video format\nOptions: mp4, mkv, avi, mov')
	audio_fmt := parser.string('audio_format', `a`, 'wav', 'Set the audio format\nOptions: mp3, m4a, wav, ogg')
	audio_cmb := parser.bool('audio_combine', `c`, false, 'Combine all the audio tracks for each video into one track')

	args := parser.finalize() or {
		eprintln(err)
		return ['error']
		// println(f_parser.usage())
		// return
	}

	return args
	*/
	// return parser
	/*
	if help == true {
		println(fp.usage())
		return
	}
	println('help: $help \n an_int: $an_int a_bool: $a_bool a_float: $a_float a_string: $a_string')
	println(additional_args.join_lines())
	*/
}

/*
fn getargs() {
	mut fp := flag.new_flag_parser(os.args)
	fp.application('flag_example_tool')
	fp.version('v0.0.0')
	fp.description('This tool is only designed to show how the flag lib is working')
	fp.skip_executable()
	help := fp.bool('help', `h`, false, 'Shows this help message')
	an_int := fp.int('an_int', `i`, 0o666, 'some int to define 0o666 is default')
	a_bool := fp.bool('a_bool', 0, false, "some \'real\' flag")
	a_float := fp.float('a_float', 0, 1.0, 'also floats')
	a_string := fp.string('a_string', `a`, 'no text', 'finally, some text with "a" an abbreviation')
	additional_args := fp.finalize() or {
		eprintln(err)
		println(fp.usage())
		return
	}
	if help == true {
		println(fp.usage())
		return
	}
	println('help: $help \n an_int: $an_int a_bool: $a_bool a_float: $a_float a_string: $a_string')
	println(additional_args.join_lines())
	res := os.exec('v version') or {
		panic('v version failed')
	}
	println(res.output)
}
*/
fn help_msg(cmd cli.Command) {
	println(cmd)
	exit(1)
}
