0 '----------------------------------------
1 ' SAMPLE PROGRAM FOR MSX-BACON
2 ' COPYRIGHT 2023 CHIKUWA TEIKOKU
3 '----------------------------------------

10 RF=0:RC=0
20 _IOTPUT("msx/me/if/NET0/conf/addr", "abehiroshi.la.coocan.jp")
30 _IOTPUT("msx/me/if/NET0/conf/port", 80)
40 _IOTPUT("msx/me/if/NET0/connect", 1)
50 FOR I=0 TO 100:NEXT I
60 _IOTGET("msx/me/if/NET0/connect", CN)
70 FOR I=0 TO 10:NEXT I
80 IF CN<>1 THEN PRINT "CONNECTION FAILED.":END
90 PRINT "CONNECTED."
100 SD$="GET /top.htm HTTP/1.1"+CHR$(13)+CHR$(10)
110 _IOTPUT("msx/me/if/NET0/msg", SD$)
120 SD$="Host: abehiroshi.la.coocan.jp"+CHR$(13)+CHR$(10)
130 _IOTPUT("msx/me/if/NET0/msg", SD$)
140 SD$=CHR$(13)+CHR$(10)
150 _IOTPUT("msx/me/if/NET0/msg", SD$)
160 FOR I=0 TO 100:NEXT I
170 _IOTGET("msx/me/if/NET0/msg", RD$)
180 IF LEN(RD$)=0 THEN 220
190 RF=1
200 PRINT RD$;
210 GOTO 170
220 IF RF=0 AND RC>3 THEN PRINT"UNABLE TO RECEIVE.":GOTO 250
230 IF RF=1 THEN GOTO 250
240 PRINT "RETRYING...":RC=RC+1:GOTO 170
250 _IOTPUT("msx/me/if/NET0/connect", 0)
