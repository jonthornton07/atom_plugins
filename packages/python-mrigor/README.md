# python-mrigor package

Integration of [mr.igor](https://pypi.python.org/pypi/mr.igor) in
[atom](https://atom.io)!

(from mr.igor's README):

> mr.igor is an extension to pyflakes that will learn where you import things
> from, and then automatically fill in missing imports from the place they are
> most often imported.

This package integrates mr.igor in your atom editor. Just install mr.igor in your system
(pip install mr.igor), and then install this package in atom.

Whenever you save a python file, mr.igor will save all imports, so that you can
remember them in any other python file just pushing `ctrl-alt-i`

The idea of this package came after having used mr.igor through Martin Aspeli's
[SublimeTextIgorPlugin](https://github.com/optilude/SublimeTextIgorPlugin) for
SublimeText 2 and Timo Stollenwerk's [MrIgor](https://github.com/tisto/MrIgor/)
for SublimeText 3.
