import requests
import functools
import pandas as pd

def check_error(func):
    @functools.wraps(func)
    def wrapper(*args, **kwargs):
        try:
            return func(*args, **kwargs)
        except Exception as e:
            print(f"Ocorreu um erro em {func.__name__}: {e}")
            return []
    return wrapper


@check_error
def get_ids(termo):
    url = f"https://api.mercadolibre.com/sites/MLA/search?q={termo}&limit=50"
    response = requests.get(url)
    ids = [item['id'] for item in response.json()['results']]
    return ids

@check_error
def get_item(item_id):
    url = f"https://api.mercadolibre.com/items/{item_id}"
    response = requests.get(url)
    return response.json()

@check_error
def create_list_from_df(terms, keys):
    list_dest = []
    for term in terms:
        ids = get_ids(term)
        for id in ids:
            item        = get_item(id)
            filter_json = {key: item[key] for key in keys if key in item}
            list_dest.append(filter_json)
    return list_dest

@check_error
def create_df_for_analysis(list_dest):
    df = pd.DataFrame(list_dest)
    df['seller_city']    = df['seller_address'].apply(lambda x: x['city']['name'])
    df['seller_state']   = df['seller_address'].apply(lambda x: x['state']['name'])
    df['seller_country'] = df['seller_address'].apply(lambda x: x['country']['name'])
    df = df.drop(columns=['seller_address'])
    return df