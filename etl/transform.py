def transform_data(data):

    for table in data.values():

        table.drop_duplicates(inplace=True)

    return data