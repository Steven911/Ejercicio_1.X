;Este programa configura el Puerto A como salida y el puerto B como entrada y mantiene
;encendido el pin RA0 del microcontrolador

    list p=16f887
    #include "p16f887.inc"

    ; CONFIG1
    ; __config 0xE3F2
     __CONFIG _CONFIG1, _FOSC_INTRC_NOCLKOUT & _WDTE_OFF & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_ON & _IESO_OFF & _FCMEN_OFF & _LVP_OFF
    ; CONFIG2
    ; __config 0xFEFF
     __CONFIG _CONFIG2, _BOR4V_BOR21V & _WRT_OFF


    ORG .0
    GOTO INICIO
    ORG .5
INICIO:
    BSF     STATUS,RP0
    BSF     STATUS,RP1
    CLRF    ANSEL
    CLRF    ANSELH
    BCF     STATUS,RP1
    CLRF    TRISA
    MOVLW   0XFF
    MOVWF   TRISB
    BCF     STATUS,RP0
    CLRF    PORTA
LOOP:
    BSF     PORTA,RA0
    GOTO    LOOP
    END