from extract import extract
from transform import transform
from load import load
from logger import logger

logger.info("ETL Started")

data = extract()

logger.info("Extraction Complete")

data = transform(data)

logger.info("Transformation Complete")

load(data)

logger.info("Loading Complete")

logger.info("ETL Finished Successfully")