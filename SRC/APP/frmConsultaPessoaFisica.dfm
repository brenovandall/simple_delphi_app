object FormConsultaPessoaFisica: TFormConsultaPessoaFisica
  Left = 0
  Top = 0
  BorderIcons = [biSystemMenu]
  Caption = 'Pessoa f'#237'sica'
  ClientHeight = 566
  ClientWidth = 1039
  Color = clBtnFace
  DefaultMonitor = dmMainForm
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poMainFormCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object pnlMain: TPanel
    Left = 0
    Top = 0
    Width = 1039
    Height = 566
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    ExplicitLeft = 232
    ExplicitTop = 224
    ExplicitWidth = 185
    ExplicitHeight = 41
    object pnlQuery: TPanel
      AlignWithMargins = True
      Left = 0
      Top = 200
      Width = 1039
      Height = 366
      Margins.Left = 0
      Margins.Top = 200
      Margins.Right = 0
      Margins.Bottom = 0
      Align = alClient
      TabOrder = 0
      ExplicitLeft = 2
      ExplicitTop = 209
      ExplicitWidth = 622
      ExplicitHeight = 232
      object btnPesquisar: TSpeedButton
        Left = 351
        Top = 24
        Width = 58
        Height = 22
        Caption = 'Pesquisar'
        OnClick = btnPesquisarClick
      end
      object lblBusca: TLabeledEdit
        Left = 8
        Top = 24
        Width = 337
        Height = 23
        BevelInner = bvNone
        BevelOuter = bvRaised
        BorderStyle = bsNone
        CharCase = ecUpperCase
        EditLabel.Width = 222
        EditLabel.Height = 15
        EditLabel.Caption = 'Filtro de busca pelo nome da pessoa f'#237'sica'
        EditLabel.Font.Charset = DEFAULT_CHARSET
        EditLabel.Font.Color = clWindowText
        EditLabel.Font.Height = -12
        EditLabel.Font.Name = 'Segoe UI'
        EditLabel.Font.Style = []
        EditLabel.ParentFont = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -12
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        Text = ''
        TextHint = 'Digite aqui...'
      end
      object query: TPanel
        AlignWithMargins = True
        Left = 4
        Top = 61
        Width = 1031
        Height = 301
        Margins.Top = 60
        Align = alClient
        BevelOuter = bvNone
        TabOrder = 1
        ExplicitLeft = 8
        ExplicitTop = 53
        ExplicitWidth = 601
        ExplicitHeight = 172
        object queryPessoaFisicaGrid: TDBGrid
          AlignWithMargins = True
          Left = 6
          Top = 3
          Width = 1019
          Height = 292
          Margins.Left = 6
          Margins.Right = 6
          Margins.Bottom = 6
          Align = alClient
          DataSource = dsPessoaFisica
          DrawingStyle = gdsClassic
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -12
          Font.Name = 'Segoe UI'
          Font.Style = []
          Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgTitleClick, dgTitleHotTrack]
          ParentFont = False
          TabOrder = 0
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Segoe UI'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'ID'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMPRESA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'REVENDA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NOME COMPLETO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CPF'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RG'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATA DE NASCIMENTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'GENERO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CEP'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ENDERECO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'NUMERO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'BAIRRO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'COMPLEMENTO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MUNICIPIO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'UF'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TELEFONE FIXO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CELULAR'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'EMAIL'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'OBSERVACOES'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'SITUACAO'
              Visible = True
            end>
        end
      end
    end
  end
  object dsPessoaFisica: TDataSource
    Left = 528
    Top = 326
  end
end
