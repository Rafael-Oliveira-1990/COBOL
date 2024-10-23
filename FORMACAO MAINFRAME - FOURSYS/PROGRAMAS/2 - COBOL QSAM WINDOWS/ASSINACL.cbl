      *-----------------------------------------------------------------
       IDENTIFICATION                   DIVISION.
       PROGRAM-ID. ASSINACLI.
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

      *== PROGRAMADOR.: RAFAEL DE OLIVEIRA
      *== ANALISTA....: IVANS SANCHES
      *== CONSULTORIA.:
      *== DATA........: 31/07/2024
ALT01 *== OBJETIVO....: ADICIONAR CONTADOR DE PAGINACAO
      *
      *
      *
      *=================================================================
       ENVIRONMENT                      DIVISION.
      *=================================================================

      *-----------------------------------------------------------------
       CONFIGURATION                    SECTION.
      *-----------------------------------------------------------------
       INPUT-OUTPUT                     SECTION.
       FILE-CONTROL.

           SELECT CLIENTES ASSIGN TO "C:\RELATORIO\dados\clientes.txt"
              FILE STATUS IS FS-CLIENTES.
      *-----------------------------------------------------------------

      *=================================================================
       DATA                             DIVISION.
      *=================================================================

      *-----------------------------------------------------------------
       FILE                             SECTION.
      *-----------------------------------------------------------------
       FD  CLIENTES.
       01  REG-CLIENTES.
           05 REG-CODIGO                PIC 9(003).
           05 REG-NOME                  PIC X(020).
           05 REG-EMAIL                 PIC X(020).
           05 REG-STREAMING             PIC X(010).
           05 REG-ASSINATURA            PIC 9(005).

      *-----------------------------------------------------------------
       WORKING-STORAGE                  SECTION.
      *-----------------------------------------------------------------

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)         VALUE
              "-----INICIO DA WORKING-----".

      *-----------------------------------------------------------------

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)         VALUE
              "-----VARIAVEL DE STATUS-----".

      *-----------------------------------------------------------------
       01  FS-CLIENTES                  PIC 9(002)         VALUE ZEROS.

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)         VALUE
              "-----CABECALHO DE PAGINACAO-----".

      *-----------------------------------------------------------------
       01  WRK-CABECALHO1.
           05 FILLER                    PIC X(020)         VALUE SPACES.
           05 FILLER                    PIC X(020)         VALUE
              "LISTA DE CLIENTES".
           05 FILLER                    PIC X(020)         VALUE SPACES.
ALT01      05 FILLER                    PIC X(008)         VALUE
              "PAGINA: ".
ALT01      05 WRK-PAGINA                PIC 9(003)        VALUE 1.

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)         VALUE
              "-----CABECALHO DE DESCRICAO-----".

      *-----------------------------------------------------------------
       01  WRK-CABECALHO2.
           05 CODIGO                    PIC X(004)         VALUE
              "COD ".
           05 WRK-NOME                  PIC X(021)         VALUE
              "NOME ".
           05 WRK-EMAIL                 PIC X(021)         VALUE
              "EMAIL ".
           05 WRK-STREAMING             PIC X(011)         VALUE
              "STREAMING ".
           05 WRK-ASSINATURA            PIC X(005)        VALUE
              "VALOR".

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)         VALUE
              "-----CABECALHO DE LINHA EM BRANCO-----".

      *-----------------------------------------------------------------
       01  WRK-CABECALHO3.
           05 WRK-BRANCO                PIC X(080)         VALUE SPACES.

      *-----------------------------------------------------------------
       01  FILLER                       PIC X(050)         VALUE
              "-----CABECALHO DE DETALHE-----".

      *-----------------------------------------------------------------
       01  WRK-DETALHE.
           05 WRK-DET-COD               PIC 9(003)         VALUE ZEROS.
           05 FILLER                    PIC X(001)         VALUE SPACES.
           05 WRK-DET-NOME              PIC X(020)         VALUE SPACES.
           05 FILLER                    PIC X(001)         VALUE SPACES.
           05 WRK-DET-EMAIL             PIC X(020)         VALUE SPACES.
           05 FILLER                    PIC X(001)         VALUE SPACES.
           05 WRK-DETE-STREAMING        PIC X(010)         VALUE SPACES.
           05 FILLER                    PIC X(001)         VALUE SPACES.
           05 WRK-DET-ASSINATURA        PIC ZZ9,99         VALUE ZEROS.

       01  WRK-QT-LINHAS                PIC 9(002)         VALUE ZEROS.

      *-----------------------------------------------------------------
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
           PERFORM 0200-PROCESSAR UNTIL FS-CLIENTES  EQUAL 10.
           PERFORM 0300-FINALIZAR.

       0000-PRINCIPAL-FIM.              EXIT.

      *-----------------------------------------------------------------
       0100-INICIALIZAR                 SECTION.
      *-----------------------------------------------------------------

           OPEN INPUT CLIENTES.
               PERFORM 0110-TESTAR-STATUS.

       0100-INICIALIZAR-FIM.            EXIT.

      *-----------------------------------------------------------------
       0110-TESTAR-STATUS               SECTION.
      *-----------------------------------------------------------------
           IF FS-CLIENTES  NOT EQUAL 00
               MOVE WRK-ERRO-ABERTURA    TO WRK-DESCRICAO-ERRO
               MOVE FS-CLIENTES          TO WRK-STATUS-ERRO
               MOVE "0110-TESTAR-STATUS" TO WRK-AREA-ERRO
               MOVE "ASSINACL"           TO WRK-PROGRAMA-ERRO
               MOVE "CLIENTES"           TO WRK-ARQUIVO-ERRO
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


       0150--VERIFICAR-VAZIO-FIM.       EXIT.

      *-----------------------------------------------------------------
       0160-LER-DADOS                   SECTION.
      *-----------------------------------------------------------------

           READ CLIENTES.

           IF FS-CLIENTES  EQUAL 35
               MOVE WRK-ERRO-LEIT    TO WRK-DESCRICAO-ERRO
               MOVE FS-CLIENTES      TO WRK-STATUS-ERRO
               MOVE "0160-LER-DADOS" TO WRK-AREA-ERRO
               MOVE "ASSINACL"       TO WRK-PROGRAMA-ERRO
               MOVE "CLIENTES"       TO WRK-ARQUIVO-ERRO
           PERFORM 9999-TRATAR-ERRO
           END-IF.


       0160-LER-DADOS-FIM.              EXIT.


      *-----------------------------------------------------------------
       0200-PROCESSAR                   SECTION.
      *-----------------------------------------------------------------

           IF WRK-QT-LINHAS GREATER 12

               PERFORM  0210-IMPRIMIR-CABECALHO
           END-IF.
               PERFORM 0220-IMPRIMIR-DETALHE
               PERFORM 0160-LER-DADOS.

       0200-PROCESSAR-FIM.              EXIT.

      *-----------------------------------------------------------------
       0210-IMPRIMIR-CABECALHO          SECTION.
      *-----------------------------------------------------------------

           DISPLAY WRK-CABECALHO3.
           DISPLAY WRK-CABECALHO1.
           DISPLAY WRK-CABECALHO3.
           DISPLAY WRK-CABECALHO2.
           DISPLAY WRK-CABECALHO3.
           MOVE 4 TO WRK-QT-LINHAS.
ALT01      ADD 1 TO WRK-PAGINA.

       0210-IMPRIMIR-CABECALHO-FIM.      EXIT.

      *-----------------------------------------------------------------
       0220-IMPRIMIR-DETALHE             SECTION.
      *-----------------------------------------------------------------

           MOVE REG-CODIGO     TO WRK-DET-COD.
           MOVE REG-NOME       TO WRK-DET-NOME.
           MOVE REG-EMAIL      TO WRK-DET-EMAIL.
           MOVE REG-STREAMING  TO WRK-DETE-STREAMING.
           MOVE REG-ASSINATURA TO WRK-DET-ASSINATURA.

               DISPLAY WRK-DETALHE.
               ADD 1 TO WRK-QT-LINHAS.

       0220-IMPRIMIR-DETALHE-FIM.       EXIT.

      *-----------------------------------------------------------------
       0300-FINALIZAR                   SECTION.
      *-----------------------------------------------------------------

           CLOSE CLIENTES.
           IF FS-CLIENTES NOT EQUAL ZEROS
               MOVE WRK-ERRO-FECHAR  TO WRK-DESCRICAO-ERRO
               MOVE FS-CLIENTES      TO WRK-STATUS-ERRO
               MOVE "0300-FINALIZAR" TO WRK-AREA-ERRO
               MOVE "ASSINACL"       TO WRK-PROGRAMA-ERRO
               MOVE "CLIENTES"       TO WRK-ARQUIVO-ERRO
               PERFORM 9999-TRATAR-ERRO
           END-IF.
           GOBACK.

       0300-FINALIZAR-FIM.              EXIT.

      *-----------------------------------------------------------------
       9999-TRATAR-ERRO                 SECTION.
      *-----------------------------------------------------------------

           DISPLAY WRK-MSG-ERROS.
           GOBACK.

       9999-TRATAR-ERRO-FIM.           EXIT.
