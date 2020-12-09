\
\ (c) Alastair Montgomery
\
\ Set character tab position
\
\ X Reg has X Coordinate
\ Y Reg has Y Coordinate
\ A contents unaltered by saving to stack.
\
    PHA
    LDA #31
    JSR oswrch
    TXA
    JSR oswrch
    TYA
    JSR oswrch
    PLA
    RTS