pico-8 cartridge // http://www.pico-8.com
version 41
__lua__
--gridcast project?
--proof of concept
#include useful.lua
#include vector.lua
#include collision.lua
#include math.lua
#include player.lua
#include camera.lua
#include palette.lua
#include luamap.lua
#include raycast.lua
#include disperscan.lua
#include gridcast.lua
#include main.lua

__gfx__
000000004644244433b33b332d112233770077005555111500000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000274444443b333333d2112233770077001111ddd100000000000000000000000000000000000000000000000000000000000000000000000000000000
0070070046224224333b33bb4455667700770077dddd555d00000000000000000000000000000000000000000000000000000000000000000000000000000000
000770006667767633333b3344556677007700775555555500000000000000000000000000000000000000000000000000000000000000000000000000000000
00077000444426443b3b333b8899aabb770077001115555500000000000000000000000000000000000000000000000000000000000000000000000000000000
007007004444464433b33b3b8899aabb77007700ddd1111100000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000422446423333b333ccddeeff00770077555ddddd00000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000067766676b333b3b3ccddeeff007700775555555500000000000000000000000000000000000000000000000000000000000000000000000000000000
515155554944444499999999ccc7cccc065555600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
555555554944449499999a99ccc7cccc065005600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
555555514944444499999999cc7c77cc065555600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
15551555999999999a99999977cccc7c065005600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
5555555144444944999999a9c7cccc77065555600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
555515554444494499999999cc7ccc7c065005600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
515155514449494499a99999ccc777cc065555600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
555555159999999999999999ccc7cccc065005600000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
010000004944444433b3393300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17100000455555543b33979300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1771000045444454333b39bb00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
177710009544445933333b3300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
17777100454444543b8b333b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
177110004544495438783b3b00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
01171000454444543383b33300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000095444459b333b3b300000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0aaaaa00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
8aeaa8ae000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
288aa288000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
a8aaaa80000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9a0000a0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
9aa00a90000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
099aa900000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000aaaaa0
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000aa9aa9a
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000aa0aa0a
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000aaaaaaa
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009aa00aa
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000009aa00a9
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000099aa90
__gff__
0001000000000000000000000000000000010000010000000000000000000000800100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
__map__
0101010101010101010101010101010101010101010101010101010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102020202020202020202020202020204020202020202020102030000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0122020202111111111102020202020201010101010201020102010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102020202111010101102020202020201020202020201020102010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102022202111010101102020202020201020101010102020102010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102020202111104111102020202020201020202020102010102010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0122020202020202021212121212121201010201020102020202010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102020202020212121212121313121212010201020102010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102022202121212121212131313131312010202020202020202010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102020212121212121313131313131313010102010101010102010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102021212121212121313131313131313130102020202020202010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102121212121212131313130113131313130101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102121212121212131313131313131313131312121202020202010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102121212121212131313131313131313131312121202020202010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102021212121212121313131313131313131312121202020202010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102021212121212121212131313131313131212121202020202010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102020212121212121212121313131313121212120202020202010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102020202021212121212121212121212121212120202020202010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102020202020212121212121212121212121212020202020202010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102020202020202021212121212121212121202020202020202010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102020202020202020202020202020202020202020202020202010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102020202020202020202020202020202020202020202020202010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0102020202020202020202020202020202020202020202020202010000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0001010101010101010101010101010101010101010101010101000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
