# ESP32 C3/C6/S3/H2 Super Mini Case

A basic case for the different ESP32 Super Mini boards. Lid clicks in place quite firmly. With optional pass-through for wires.

![Examples](docs/examples.png)

## Variants

The different boards have different dimensions. This repo contains generated STL files for 23mm and 24mm boards. Measure your board and take the one that fits best. Or generate your own with the OpenSCAD tool.

## OpenSCAD

Created using OpenSCAD, using BOSL2 and hex-grid libraries. Variable size cases can be generated using SCAD source.

```
    // Regular case, default dimensions for C3 Super Minin board
    case(18, 23.2, 8.5);

    // Same case, but with pass through for wires
    cable_case(18, 23.2, 8.5);

    // A closed lid
    lid(18, 23.2);
```

## Online

Find the STL online:
https://www.printables.com/model/1137008-esp32-c3-super-mini-case 

## License

Copyright 2025, Jeroen van Grondelle

Redistribution and use in source and binary forms, with or without modification, are permitted provided that the following conditions are met:

Redistributions of source code must retain the above copyright notice, this list of conditions and the following disclaimer. Redistributions in binary form must reproduce the above copyright notice, this list of conditions and the following disclaimer in the documentation and/or other materials provided with the distribution. Neither the name of the copyright holder nor the names of its contributors may be used to endorse or promote products derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
