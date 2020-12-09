\
\ (c) Alastair Montgomery
\
\ Change screen mode
\
\ A contents mode 0-7
\
    PHA
    LDA #22
    JSR oswrch
    PLA
    JSR oswrch
    RTS
