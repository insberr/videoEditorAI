import os
import subprocess
import sys
import argparse

_dir = os.getcwd()

# Command line arguments
parser = argparse.ArgumentParser()

parser.add_argument('-dir', default=_dir, help='Set the working directory')
parser.add_argument('-input', default='input', help='The directory to the folder the video(s) are stored in (The directory is set on the set working directory))')
parser.add_argument('-output', default='output', help='Output files directory (without a / in front)')
parser.add_argument('-name', default='finished-product', help='The name of the finished product')
parser.add_argument('-video_format', default='mp4', choices=['mp4', 'mkv', 'avi', 'mov'])
parser.add_argument('-audio_format', default='wav', choices=['mp3', 'm4a', 'wav', 'ogg'])
parser.add_argument('-audio_combine', default='false', help='Combine all the audio tracks for each video into one track')

args = parser.parse_args()

def remove_slash(string, place=1):
	if (place == 0 or place == 'before'):
		return string.replace('/', '', 1)
	elif (place == 1 or place == 'after'):
		return string.replace('/', '', len(string) - 1)
	elif (place == 2 or place == 'both'):
		return remove_slash(remove_slash(string, 'before'), 'after')
	else:
		return remove_slash(string, 0)

# Directories
if (remove_slash(args.dir, 2) != _dir):
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
		audio_tracks = subprocess.check_output(f'ffprobe -loglevel error -select_streams a -show_entries stream=codec_type -of default=nw=1 {_dir_in}/{video} | find /c /v ""', shell=True)
		print(audio_tracks)
		for i in range(int(audio_tracks.decode("utf-8"))):
			subprocess.call(f'ffmpeg -i {_dir_in}/{video} -map 0:a:{str(i)} {_dir_out}/audio/{video.split(".")[0]}-track-{str(i)}.m4a -y')

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
