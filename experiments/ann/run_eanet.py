#!/usr/bin/env python3

import os
import sys
import signal
import shlex, subprocess
import json
import logging


def main():
    res_list = {}

    for filename in os.listdir("./"):
        if os.path.isfile(filename) and filename.endswith('.bin'):
            logging.info('Testing file: ' + filename)
            f = subprocess.Popen('python ./eanet.py --in_b ' + filename, shell=True, stdout=subprocess.PIPE).stdout

            progress_res = []
            res = None
            epoch = 0
            for l in f:
                line = l.decode('ascii')
                if 'loss' in line:
                    # todo parse loss and acc
                    res = line.split('[==============================]')[-1]
                    loss = float(res.split('loss: ')[1].split(' ')[0])
                    acc = float(res.split('acc: ')[1].split(' ')[0])
                    progress_res.append((loss, acc))
                if 'Score' in line:
                    res = line.split('[')[-1]
                    loss = float(res.split(',')[0])
                    acc = float(res.split(',')[1].split(']')[0])
                    res = (loss, acc)

            res_list[filename] = (progress_res, res)

    with open('result.json', 'w') as fp:
        json.dump(res_list, fp)


if __name__ == "__main__":
    logging.basicConfig(filename='ann_runner.log', level=logging.INFO, format='%(asctime)s %(message)s')
    main()
