import wbgapi as wb
import gspread
from oauth2client.service_account import ServiceAccountCredentials

def connect_db_sheet():
    scope = ['https://spreadsheets.google.com/feeds',
            'https://www.googleapis.com/auth/drive']

    creds  = ServiceAccountCredentials.from_json_keyfile_name('./vernal-segment-389623-96ee216f1d09.json', scope)
    client = gspread.authorize(creds)
    sheet  = client.open_by_key('16iGfSgLqyfYz8elqUCuOMzj6ocl5qBgUS7tio-ZPVww').sheet1
    return sheet


# Função para criar o DataFrame
def get_infos_api():
    NET = "IT.NET.USER.ZS"
    GSR = "BM.GSR.CMCP.ZS"
    GSRBX = "BX.GSR.CMCP.ZS"
    CEL = "IT.CEL.SETS"
    NETBB = "IT.NET.BBND"
    MLT = "IT.MLT.MAIN"

    df = wb.data.DataFrame(
        [NET, GSR, GSRBX, CEL, NETBB, MLT],
        'MDG',
        time=range(1960, 2024),
        numericTimeKeys=True,
        labels=True,
        columns='series',
    )

    df.rename(columns={
        "IT.MLT.MAIN": "qtd_assinatura_tel",
        "IT.NET.USER.ZS": "perc_uso_internet",
        "BM.GSR.CMCP.ZS": "perc_import_servicos",
        "BX.GSR.CMCP.ZS": "perc_servicos_info",
        "IT.CEL.SETS": "qtd_assinatura_cel",
        "IT.NET.BBND": "qtd_assinatura_net_fixa",
    }, inplace=True)

    df = df.reset_index().drop(columns='Time')
    df = df.fillna('')
    return df

# Inserir dados no Google Sheets
def insert_dataframe(sheet, df):
    rows = df.values.tolist()
    header = df.columns.tolist()
    sheet.insert_row(header, 1)  # Inserir cabeçalho
    for i, row in enumerate(rows, start=2):
        #print(row)   habilitar para ver os registros antes do insert
        sheet.insert_row(row, i)