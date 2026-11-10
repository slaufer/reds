#!/usr/bin/env python3
# simulate redshift -O 1000 -b 0.7 (ramp scaled by whitepoint*brightness) and report WCAG contrast
def x256(n):
    if n<16: return [(0,0,0),(170,0,0),(0,170,0),(170,80,0),(0,0,170),(170,0,170),(0,170,170),(170,170,170),(80,80,80),(255,80,80),(80,255,80),(255,255,80),(80,80,255),(255,80,255),(80,255,255),(255,255,255)][n]
    if n<232:
        n-=16; L=[0,95,135,175,215,255]; return (L[n//36],L[n//6%6],L[n%6])
    v=8+10*(n-232); return (v,v,v)
def hx(s): s=s.lstrip('#'); return tuple(int(s[i:i+2],16) for i in (0,2,4))
W=(1.0,0.18172716,0.0); B=0.7
def lum(c):
    out=[]
    for ch,w in zip(c,W):
        v=ch/255*w*B
        out.append(v/12.92 if v<=0.04045 else ((v+0.055)/1.055)**2.4)
    return 0.2126*out[0]+0.7152*out[1]+0.0722*out[2]
def cr(a,b):
    la,lb=sorted([lum(a),lum(b)],reverse=True); return (la+0.05)/(lb+0.05)
pairs=[
 ('prompt clock 0/87 -> 0/215', (x256(0),x256(87)), (x256(0),x256(215))),
 ('prompt cwd 0/45 -> 0/172', (x256(0),x256(45)), (x256(0),x256(172))),
 ('prompt sep clock|cwd 87/45 -> 215/172', (x256(87),x256(45)), (x256(215),x256(172))),
 ('prompt branch 0/245 -> 0/137', (x256(0),x256(245)), (x256(0),x256(137))),
 ('prompt staged 0/34 -> 0/172', (x256(0),x256(34)), (x256(0),x256(172))),
 ('prompt $ 45 -> 214 on black', (x256(45),x256(16)), (x256(214),x256(16))),
 ('vim Normal 254/232 -> 180/232', (x256(254),x256(232)), (x256(180),x256(232))),
 ('vim Identifier 51 -> 173', (x256(51),x256(232)), (x256(173),x256(232))),
 ('vim String 122 -> 214', (x256(122),x256(232)), (x256(214),x256(232))),
 ('vim Type 29 -> 172', (x256(29),x256(232)), (x256(172),x256(232))),
 ('vim Comment 105/234 -> 95/232', (x256(105),x256(234)), (x256(95),x256(232))),
 ('vim LineNr 23 -> 94', (x256(23),x256(16)), (x256(94),x256(16))),
 ('vim StatusLine 16/87 -> 16/172', (x256(16),x256(87)), (x256(16),x256(172))),
 ('vim Visual 159/38 -> 16/180', (x256(159),x256(38)), (x256(16),x256(180))),
 ('ls dir ansi blue -> 214', (hx('5050ff'),(0,0,0)), (x256(214),(0,0,0))),
 ('ls exec ansi green -> 209', (hx('50ff50'),(0,0,0)), (x256(209),(0,0,0))),
 ('ls archive 01;31 -> 173', (hx('ff5050'),(0,0,0)), (x256(173),(0,0,0))),
 ('ls backup -> 94', (hx('505050'),(0,0,0)), (x256(94),(0,0,0))),
 ('alacritty blue on black', (hx('0000aa'),(0,0,0)), (hx('983400'),(0,0,0))),
 ('alacritty bright black', (hx('505050'),(0,0,0)), (hx('843010'),(0,0,0))),
 ('alacritty fg', (hx('ffffff'),(0,0,0)), (hx('e0b080'),(0,0,0))),
 ('i3 focused ws text', (hx('00d7ff'),hx('002f5f')), (hx('ffd7af'),hx('870000'))),
 ('i3 focused title vs unfocused bg', (hx('002f5f'),hx('111111')), (hx('870000'),hx('000000'))),
 ('i3 unfocused title text', (hx('888888'),hx('111111')), (hx('875f5f'),hx('000000'))),
 ('i3 urgent ws', (hx('000000'),hx('00d7ff')), (hx('000000'),hx('ffaf00'))),
]
print(f"{'pair':42} {'old':>6} {'new':>6}")
for n,o,w in pairs: print(f"{n:42} {cr(*o):6.2f} {cr(*w):6.2f}")
