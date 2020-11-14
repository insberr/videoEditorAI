import os
import subprocess
import sys
import argparse

_dir = os.getcwd()

# Command line arguments
parser = argparse.ArgumentParser()

parser.add_argument('-dir', default=_dir, help='Set the working directory')
parser.add_argument('-input', default='input', help='Input file(s) directory (without a / in front)')
parser.add_argument('-output', default='output', help='Output files directory (without a / in front)')
parser.add_argument('-name', default='finished-product', help='The name of the finished product')
parser.add_argument('-format', default='mp4', choices=['mp4', 'mkv', 'avi', 'mov'])

args = parser.parse_args()


# Directories
if (args.dir != _dir):
	if (os.path.exists(args.dir)):
		_dir = args.dir
	else:
		print(f'The provided directory `{args.dir}` can not be found')
		exit()

os.chdir(_dir)

_dir_in = args.input
_dir_out = args.output

if (os.path.exists(_dir_out) == False): os.mkdir(_dir_out)
if (os.path.exists(_dir_out + '/audio') == False): os.mkdir(_dir_out + '/audio')
if (os.path.exists(_dir_out + '/clips') == False): os.mkdir(_dir_out + '/clips')

inputFiles = os.listdir(_dir_in)
outputFile = f'{_dir_out}\\{args.name}.{args.format}'

# storage
cut_timestamps = []

# print([_dir, _dir_in, _dir_out, inputFiles, outputFile])
# exit()

def separate_audio_video():
	for video in inputFiles:
		for i in range(10):
			subprocess.call(f'ffmpeg -i {_dir_in}/{video} -map 0:a:{str(i)} {_dir_out}/audio/output{str(i)}.m4a')

def remove_silence(video):
    print(video)


def cut_video(timestamps, ):
    print('Cut video')


separate_audio_video()


# cmd = [
#    'ffmpeg',
#    '-ss', '00:0:00.0', '-t', '00:00:30.0',
#    '-i', inputPath,
#    '-map', '0:v', '-map', '0:3',
#    outputPath
#]

# subprocess.call('ffmpeg', cmd)
