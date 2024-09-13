import defs

sheet = defs.connect_db_sheet()
df    = defs.get_infos_api()

#limpar a planilha antes do insert
sheet.clear()

defs.insert_dataframe(sheet, df)
print("finalizado com sucesso.")
