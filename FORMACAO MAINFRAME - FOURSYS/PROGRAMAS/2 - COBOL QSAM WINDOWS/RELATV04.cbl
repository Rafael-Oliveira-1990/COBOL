      *-----------------------------------------------------------------
       IDENTIFICATION                   DIVISION.
       PROGRAM-ID. RELATv04.
      *=================================================================
      *== PROGRAMA....: ASSINACLI
      *== PROGRAMADOR.: RAFAEL DE OLIVEIRA
      *== ANALISTA....: IVAN SANCHES
      *== DATA........: 31/07/2024
      *== CONSULTORIA:
      *-----------------------------------------------------------------
      *== OBJETIVO....: CRIAR UM PROGRAMA QUE MOSTRE EM TELA ESTATISTICA
      *                 E PAGINACAO.
      *-----------------------------------------------------------------
      *===================ESPECIFICACOES DO PROGRAMA====================
      *    ARQUIVO                    TIPO               BOOK
      *    ASSINACL                  INPUT              BOOKMSG
      *    ASSINACL                  INPUT              BOOKASSI
      *-----------------------------------------------------------------
      *== MODULOS
      *
      *-----------------------------------------------------------------
      *-------------------ALTERACOESDO PROGRAMA-------------------------

ALT01 *== PROGRAMADOR.: RAFAEL DE OLIVEIRA
.     *== ANALISTA....: IVANS SANCHES
.     *== CONSULTORIA.:
.     *== DATA........: 31/07/2024
ALT01 *== OBJETIVO....: ADICIONOU CONTADOR DE PAGINACAO
      *=================================================================
ALT02 *== PROGRAMADOR.: RAFAEL DE OLIVEIRA
.     *== ANALISTA....: IVANS SANCHES
.     *== CONSULTORIA.:
.     *== DATA........: 01/08/2024
ALT02 *== OBJETIVO....: ADICINOU SECAO DE ESTATISTICA COM TOTAL DE
      *                 REGISTROS LIDOS, FIM DO PROGRAMA E ESPACO EM
      *                 BRANCO PARA DEIXAR LINHA EM BRANCO.
      *=================================================================
ALT03 *== PROGRAMADOR.: RAFAEL DE OLIVEIRA
.     *== ANALISTA....: IVANS SANCHES
.     *== CONSULTORIA.:
.     *== DATA........: 02/078/2024
ALT03 *== OBJETIVO....: ADICIONAR ABRIR O PROGRAMA EM MODO OUTPUT
      *-----------------------------------------------------------------

      *=================================================================
       ENVIRONMENT                      DIVISION.
      *=================================================================

      *-----------------------------------------------------------------
       CONFIGURATION                    SECTION.
      *-----------------------------------------------------------------
       SPECIAL-NAMES.
           DECIMAL-POINT IS COMMA.
      *-----------------------------------------------------------------
       INPUT-OUTPUT                     SECTION.
      *-----------------------------------------------------------------

       FILE-CONTROL.
           SELECT CLIENTES ASSIGN TO "C:\RELATORIO\dados\clientes.txt"
           FILE STATUS IS FS-CLIENTES.

ALT03      SELECT RELAT ASSIGN   TO  "C:\RELATORIO\dados\RELATORIO.txt"
ALT03      FILE STATUS IS FS-RELAT.
      *-----------------------------------------------------------------

      *=================================================================
       DATA                             DIVISION.
      *=================================================================

      *-----------------------------------------------------------------
       FILE                             SECTION.
      *-----------------------------------------------------------------
      *
      *            INPUT - DADOS DO ARQUIVO DE ENTRADA(CLIENTES)
      *            LRECL = 58 POSICOES
      *
      *-----------------------------------------------------------------
       FD  CLIENTES.
       01  REG-CLIENTES.
           05 REG-CODIGO                PIC 9(003).
           05 REG-NOME                  PIC X(020).
           05 REG-EMAIL                 PIC X(20).
           05 REG-STREAMING             PIC X(010).
           05 REG-ASSINATURA            PIC 9(003)V99.
      *-----------------------------------------------------------------
      *
      *            OUTPUT - DADOS DO ARQUIVO DE SAIDA(RELAT)
      *            LRECL = 68 POSICOES
      *
      *-----------------------------------------------------------------

ALT03  FD  RELAT.
ALT03  01  REG-RELAT                    PIC X(068).

      *-----------------------------------------------------------------
       WORKING-STORAGE                  SECTION.
      *-----------------------------------------------------------------

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)         VALUE
              "INICIO DA WORKING".
      *-----------------------------------------------------------------


      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)         VALUE
              "-----VARIAVEL DE STATUS-----".
      *-----------------------------------------------------------------

       01  FS-CLIENTES                  PIC 9(002)         VALUE ZEROS.

ALT03 *-----------------------------------------------------------------
.      01  FILLER                       PIC X(050)         VALUE
.             "-----VARIAVEL DE STATUS DE GRAVACAO-----".
.     *-----------------------------------------------------------------
.
ALT03  01  FS-RELAT                     PIC 9(002)         VALUE ZEROS.

      *-----------------------------------------------------------------

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)         VALUE
              "CABECALHO DE PAGINACAO".
      *-----------------------------------------------------------------

       01  WRK-CABECALHO1.
           05 FILLER                    PIC X(015)         VALUE SPACES.
           05 FILLER                    PIC X(020)         VALUE
              "LISTA DE CLIENTES".
           05 FILLER                    PIC X(020)         VALUE SPACES.
ALT01      05 FILLER                    PIC X(010)         VALUE
              "PAGINA:".
ALT01      05 WRK-PAGINA                PIC 9(003)         VALUE 1.

       01  WRK-PAGINA-AUX               PIC 9(003)V99 COMP-3 VALUE 1.
      *-----------------------------------------------------------------

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)         VALUE
              "-----CABECALHO DE DESCICAO-----".
      *-----------------------------------------------------------------

       01  WRK-CABECALHO2.
           05 WRK-CODIGO                PIC X(004)         VALUE
              "COD ".
           05 WRK-NOME                  PIC X(021)         VALUE
              "NOME ".
           05 WRK-EMAIL                 PIC X(021)         VALUE
              "EMAIL".
           05 WRK-STREAMING             PIC X(011)         VALUE
              "STREAMING".
           05 WRK-ASSINATURA            PIC ZZ9,99         VALUE
              "VALOR".
      *-----------------------------------------------------------------

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)         VALUE
              "-----CABECALHO DE LINHA EM BRANCO-----".
      *-----------------------------------------------------------------

       01  WRK-CABECALHO3.
           05 WRK-BRANCO                PIC X(080)         VALUE SPACES.
      *-----------------------------------------------------------------

       01  WRK-CABECALHO4.
           05  WRK-SUB-TOTAL-ACU        PIC X(025)         VALUE
              "VALOR TOTAL POR PAGINA".
           05  WRK-ACU-ASSINATURA      PIC 9(003)V99       VALUE ZEROS.

       01  WRK-CABECALHO5.
           05   WRK-TOTAL-ASSI         PIC X(025)          VALUE
              "VALOR TOTAL GERAL" .
           05  WRK-TOTAL-ASSINATURA    PIC 9(003)V99       VALUE ZEROS.

       01 FILLER                       PIC X(02)           VALUE SPACES.
      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)         VALUE
              "-----VARIAVEIS DE DETALHE CABECALHO-----".
      *-----------------------------------------------------------------

       01  WRK-DETALHE.
           05 WRK-DET-COD              PIC 9(003)          VALUE ZEROS.
           05 FILLER                   PIC X(001)          VALUE SPACES.
           05 WRK-DET-NOME             PIC X(020)          VALUE SPACES.
           05 FILLER                   PIC X(001)          VALUE SPACES.
           05 WRK-DET-EMAIL            PIC X(020)          VALUE SPACES.
           05 FILLER                   PIC X(001)          VALUE SPACES.
           05 WRK-DET-STREAMING        PIC X(010)          VALUE SPACES.
           05 FILLER                   PIC X(001)          VALUE SPACES.
           05 WRK-DET-ASSINATURA       PIC 9(003)V99       VALUE ZEROS.

      *-----------------------------------------------------------------

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)         VALUE
              "-----VARIAVEL DE QUANTIDADE DE LINHAS-----".

      *-----------------------------------------------------------------
       01  WRK-QT-LINHAS                PIC 9(002)  COMP-3 VALUE ZEROS.

      *-----------------------------------------------------------------
ALT02  01  FILLER                       PIC X(050)         VALUE
.             "-----VARIAVEL DE ACUMULACAO-----".
.
.     *-----------------------------------------------------------------
.
.      01  WRK-ACU-LIDOS                PIC 9(002)  COMP-3 VALUE ZEROS.
ALT02 *-----------------------------------------------------------------

       01  FILLER                       PIC X(050)         VALUE
              "-----BOOK DE MENSAGEM DEDE ERRO DOS ARQUIVOS-----".

      *-----------------------------------------------------------------

       COPY "BOOKASSI".

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)         VALUE
              "-----BOOK MENSAGEM DE STATUS DE ERRO PROGRAMA-----".

      *-----------------------------------------------------------------
       COPY "BOOKMSG".

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)         VALUE
             "-----FIM DA WORKING-----".
      *-----------------------------------------------------------------


      *=================================================================
       PROCEDURE                        DIVISION.
      *=================================================================

      *-----------------------------------------------------------------
       0000-PRINCIPAL                   SECTION.
      *-----------------------------------------------------------------

           PERFORM 0100-INICIALIZAR.
           PERFORM 0150-VERIFICAR-VAZIO.
           PERFORM 0200-PROCESSAR UNTIL FS-CLIENTES EQUAL 10.
           PERFORM 0300-FINALIZAR.

       0000-PRINCIPAL-FIM.              EXIT.

      *-----------------------------------------------------------------
       0100-INICIALIZAR                 SECTION.
      *-----------------------------------------------------------------

           OPEN INPUT CLIENTES
               OUTPUT RELAT.
               PERFORM 0110-TESTAR-STATUS.
       0100-INICIALIZAR-FIM.            EXIT.

      *-----------------------------------------------------------------
       0110-TESTAR-STATUS               SECTION.
      *-----------------------------------------------------------------

       0111-ABERTURA-CLIENTES.

           IF FS-CLIENTES NOT EQUAL ZEROS
               MOVE WRK-ERRO-ABERTURA        TO WRK-DESCRICAO-ERRO
               MOVE FS-CLIENTES              TO WRK-STATUS-ERRO
               MOVE "0111-ABERTURA-CLIENTES" TO WRK-AREA-ERRO
               MOVE "RELATV03"               TO WRK-PROGRAMA-ERRO
               MOVE "CLIENTES"               TO WRK-ARQUIVO-ERRO
               PERFORM 9999-TRATAR-ERRO
           END-IF.

       0112-ABERTURA-RELAT.

           IF FS-CLIENTES NOT EQUAL ZEROS
               MOVE WRK-ERRO-ABERTURA        TO WRK-DESCRICAO-ERRO
               MOVE FS-RELAT                 TO WRK-STATUS-ERRO
               MOVE "0112-ABERTURA-RELAT"    TO WRK-AREA-ERRO
               MOVE "RELATV03"               TO WRK-PROGRAMA-ERRO
               MOVE "RELAT"                  TO WRK-ARQUIVO-ERRO
               PERFORM 9999-TRATAR-ERRO
           END-IF.

       0110-TESTAR-STATUS-FIM.          EXIT.

      *-----------------------------------------------------------------
       0150-VERIFICAR-VAZIO             SECTION.
      *-----------------------------------------------------------------

           PERFORM 0160-LER-DADOS.

           IF FS-CLIENTES EQUAL 10
               MOVE WRK-ARQ-VAZIO          TO WRK-DESCRICAO-ERRO
               MOVE FS-CLIENTES            TO WRK-STATUS-ERRO
               MOVE "0150-VERIFICAR-VAZIO" TO WRK-AREA-ERRO
               MOVE "ASSINACL"             TO WRK-PROGRAMA-ERRO
               MOVE "CLIENTES"             TO WRK-ARQUIVO-ERRO
               PERFORM 9999-TRATAR-ERRO
           ELSE
               PERFORM 0210-IMPRIMIR-CABECALHO
           END-IF.

       0150-VERIFICAR-VAZIO-FIM.        EXIT.

      *-----------------------------------------------------------------
       0160-LER-DADOS                   SECTION.
      *-----------------------------------------------------------------

           READ CLIENTES.

           IF FS-CLIENTES NOT EQUAL 00 AND NOT EQUAL 10
               MOVE WRK-ERRO-LEIT    TO WRK-DESCRICAO-ERRO
               MOVE FS-CLIENTES      TO WRK-STATUS-ERRO
               MOVE "0160-LER-DADE"  TO WRK-AREA-ERRO
               MOVE "ASSINACL"       TO WRK-PROGRAMA-ERRO
               MOVE "CLIENTES"       TO WRK-ARQUIVO-ERRO
               PERFORM 9999-TRATAR-ERRO
           END-IF.

       0160-LER-DADOS-FIM.              EXIT.

      *-----------------------------------------------------------------
       0200-PROCESSAR                   SECTION.
      *-----------------------------------------------------------------

               ADD 1   TO WRK-ACU-LIDOS.
               COMPUTE WRK-TOTAL-ASSINATURA EQUAL REG-ASSINATURA +
                                               WRK-TOTAL-ASSINATURA.

           IF WRK-QT-LINHAS GREATER 12
               PERFORM 0210-IMPRIMIR-CABECALHO
           END-IF.
ALT02
               PERFORM 0220-IMPRIMIR-DETALHE.
               PERFORM 0160-LER-DADOS.

           IF FS-CLIENTES EQUAL 10
               PERFORM 0205-SUB-TOTAL
               PERFORM 0206-TOTAL-GERAL
           END-IF.

       0200-PROCESSAR-FIM.              EXIT.

      *-----------------------------------------------------------------
       0205-SUB-TOTAL                   SECTION.
      *-----------------------------------------------------------------

           IF WRK-PAGINA-AUX > 1
               MOVE WRK-CABECALHO4  TO REG-RELAT
               WRITE REG-RELAT AFTER 1 LINE
               MOVE ZEROS TO WRK-ACU-ASSINATURA
           END-IF.

       0205-SUB-TOTAL-FIM.              EXIT.

      *-----------------------------------------------------------------
       0206-TOTAL-GERAL                 SECTION.
      *-----------------------------------------------------------------

               MOVE WRK-CABECALHO5 TO REG-RELAT
               WRITE REG-RELAT AFTER 1 LINE.

       0206-TOTAL-GERAL-FIM.            EXIT.


      *-----------------------------------------------------------------
       0210-IMPRIMIR-CABECALHO          SECTION.
      *-----------------------------------------------------------------

           PERFORM 0205-SUB-TOTAL.

           MOVE WRK-PAGINA-AUX TO WRK-PAGINA

           IF WRK-PAGINA-AUX       GREATER 1
               MOVE WRK-CABECALHO1 TO REG-RELAT
               WRITE REG-RELAT     AFTER PAGE
           ELSE
               MOVE WRK-CABECALHO1 TO REG-RELAT
               WRITE REG-RELAT     AFTER 1 LINE
           END-IF.

               MOVE WRK-CABECALHO2 TO REG-RELAT
               WRITE REG-RELAT     AFTER 1 LINE

               MOVE WRK-CABECALHO3 TO REG-RELAT
               WRITE REG-RELAT      AFTER 1 LINE

               MOVE 4                TO WRK-QT-LINHAS.
               ADD 1                 TO WRK-PAGINA-AUX.

       0210-IMPRIMIR-CABECALHO-FIM.      EXIT.

      *-----------------------------------------------------------------
       0220-IMPRIMIR-DETALHE             SECTION.
      *-----------------------------------------------------------------

ALT03      IF FS-RELAT                      EQUAL ZEROS
.              MOVE REG-CODIGO              TO WRK-DET-COD
               MOVE REG-NOME                TO WRK-DET-NOME
               MOVE REG-EMAIL               TO WRK-DET-EMAIL
               MOVE REG-STREAMING           TO WRK-DET-STREAMING
               MOVE REG-ASSINATURA          TO WRK-DET-ASSINATURA

.              MOVE WRK-DETALHE             TO REG-RELAT
               WRITE REG-RELAT AFTER 1 LINE
               ADD WRK-DET-ASSINATURA TO WRK-ACU-ASSINATURA
.          ELSE
.              MOVE WRK-ERRO-GRAVAR         TO WRK-DESCRICAO-ERRO
.              MOVE FS-RELAT                TO WRK-STATUS-ERRO
.              MOVE "0220-IMPRIMIR-DETALHE" TO WRK-AREA-ERRO
.              MOVE "RELATV03"              TO WRK-PROGRAMA-ERRO
.              MOVE "RELAT"                 TO WRK-ARQUIVO-ERRO
.              PERFORM 9999-TRATAR-ERRO
ALT03      END-IF.
               ADD 1                        TO WRK-QT-LINHAS.

       0220-IMPRIMIR-DETALHE-FIM.       EXIT.

ALT02 *-----------------------------------------------------------------
.      0230-ESTATISTICA                 SECTION.
.     *-----------------------------------------------------------------

.              DISPLAY WRK-TRACO.
.              DISPLAY "TOTAL DE REGISTROS LIDOS: " WRK-ACU-LIDOS.
.              DISPLAY WRK-TRACO.
.              DISPLAY WRK-FIM-PROGRAMA.
.              DISPLAY WRK-TRACO.

ALT02  0230-ESTATISTITA-FIM.            EXIT.

      *-----------------------------------------------------------------
       0300-FINALIZAR                   SECTION.
      *-----------------------------------------------------------------

ALT02      IF  WRK-ACU-LIDOS GREATER ZEROS
.              PERFORM 0230-ESTATISTICA
ALT02      END-IF.

               CLOSE CLIENTES.

ALT03  0310-FCHAR-CLIENTES.

           IF FS-CLIENTES NOT EQUAL ZEROS
               MOVE WRK-ERRO-FECHAR        TO WRK-DESCRICAO-ERRO
               MOVE FS-CLIENTES            TO WRK-STATUS-ERRO
               MOVE "0310-FECHAR-CLIENTES" TO WRK-AREA-ERRO
               MOVE "RELATV03"             TO WRK-PROGRAMA-ERRO
               MOVE "CLIENTES"             TO WRK-ARQUIVO-ERRO
               PERFORM 9999-TRATAR-ERRO
           END-IF.

ALT03  0320-FECHAR-RELAT.
.
.              CLOSE RELAT.
.
.          IF FS-RELAT NOT EQUAL ZEROS
.              MOVE WRK-ERRO-FECHAR        TO WRK-DESCRICAO-ERRO
.              MOVE FS-RELAT               TO WRK-STATUS-ERRO
.              MOVE "0320-FECHAR-RELAT"    TO WRK-AREA-ERRO
.              MOVE "RELATV03"             TO WRK-PROGRAMA-ERRO
.              MOVE "RELAT"                TO WRK-ARQUIVO-ERRO
.              PERFORM 9999-TRATAR-ERRO
.          END-IF.
ALT03
               GOBACK.

       0300-FINALIZAR-FIM.              EXIT.

      *-----------------------------------------------------------------
       9999-TRATAR-ERRO                 SECTION.
      *-----------------------------------------------------------------
               DISPLAY WRK-MSG-ERROS.
               GOBACK.
       9999-TRATAR-ERRO-FIM.            EXIT.
