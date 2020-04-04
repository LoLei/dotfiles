#!/usr/bin/env python
# Combination of:
# https://unix.stackexchange.com/a/471058/164077
# https://stackoverflow.com/a/185941/4644044

import os
from pathlib import Path
import shutil
import gi
import sys
gi.require_version('Gtk', '3.0')
from gi.repository import Gtk, Gio

def del_dir_contents(folder):
    for filename in os.listdir(folder):
        file_path = os.path.join(folder, filename)
        try:
            if os.path.isfile(file_path) or os.path.islink(file_path):
                os.unlink(file_path)
            elif os.path.isdir(file_path):
                shutil.rmtree(file_path)
        except Exception as e:
            print('Failed to delete %s. Reason: %s' % (file_path, e))


def symlink_mru(tg_dir):
    del_dir_contents(tg_dir)
    rec_mgr = Gtk.RecentManager.get_default()
    for item in rec_mgr.get_items():
        if item.exists():
            uri = item.get_uri()
            tg = Gio.File.new_for_uri(uri)
            tg_path = tg.get_path()
            b_name = tg.get_basename()
            dt_path = tg_dir + "/" + b_name
            dt = Gio.File.new_for_path(dt_path)
            try:
                dt.make_symbolic_link(tg_path, cancellable=None)
            except gi.repository.GLib.Error:
                print(".", end=" ")


def main():
    home = str(Path.home())
    tg_dir = home + "/mru"
    if len(sys.argv) > 1:
        tg_dir = sys.argv[1]
    symlink_mru(tg_dir)


if __name__ == "__main__":
    main()
