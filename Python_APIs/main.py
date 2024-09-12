import defs

#parameters for process
param_search_term  = ['chromecast', 'google home', 'apple tv','Amazon Fire TV']
param_keys_payload = ["id", 'item_id', 'title', "status", 'seller_id', 'price', 'category_id',  "initial_quantity", "listing_type_id","domain_id", "date_created", "last_updated","seller_address"]

# process data and creating the final df
list_json_results = defs.create_list_from_df(param_search_term, param_keys_payload)
df_for_analysis   = defs.create_df_for_analysis(list_json_results)

#persist df on file csv
df_for_analysis.to_csv('dados.csv', index=False, sep=",")


print("processing success")