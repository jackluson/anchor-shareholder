import os
import datetime
from dotenv import load_dotenv
import asyncio
load_dotenv()
from prisma import Prisma

async def main() -> None:
    prisma = Prisma()
    await prisma.connect()
    holder_list = await prisma.shareholder.find_many()
    print("holder_list", holder_list)

    # write your queries here
    report_date = datetime.datetime(2024, 6, 30, hour=0, minute=0, second=0, microsecond=0, tzinfo=None)
    holder = await prisma.shareholder.create(data={
        'stock_code': '301266',
        'stock_name':  '宇邦新材',
        'type': '非流通',
        'rank': 1,
        'sharehd_name': '苏州聚信源企业管理有限公司',
        'sharehd_radio': 54.33,
        'sharehd_amount': 56500000,
        'sharehd_type': '投资公司',
        'relation_type': '控股股东',
        'date': report_date,
	})
    print("holder", holder)

    await prisma.disconnect()

if __name__ == '__main__':
    asyncio.run(main())