import os
import datetime
from dotenv import load_dotenv
import asyncio
from typing import Dict
load_dotenv()
from prisma import Prisma
from infra.api.eastmoney import ApiEastMoney
from infra.config.parser import conf_parser

async def save_holder_list(holder_list: list[Dict]) -> None:
    prisma = Prisma()
    await prisma.connect()
    exit_holder_list = await prisma.shareholder.find_many()
    print("exit_holder_list", len(exit_holder_list))
    print("holder_list", holder_list)
    res = await prisma.shareholder.create_many(data=holder_list)
    # res = await prisma.shareholder.create_many(data=holder_list)
    print("res", res)
    await prisma.disconnect()

def fetch_holder_list(code, name):
    api_eastmoney = ApiEastMoney()
    quarter_date = conf_parser.get_latest_quarter_date()
    res_list = api_eastmoney.get_holder_list(code=code, end_date=quarter_date)
    holder_list = []
    for item in res_list:
        change_amount = None
        change_ratio = None
        if item['HOLD_NUM_CHANGE'] == '新进':
            change_amount = item['HOLD_NUM']
            change_ratio = None
        elif item['HOLD_NUM_CHANGE'] == '不变':
            change_amount = None
            change_ratio = None
        else:
            change_amount = int(item['HOLD_NUM_CHANGE'])
            change_ratio = float(item['NEW_CHANGE_RATIO'])
        holder_list.append({
            'stock_code': code,
            'stock_name': name,
            'type': item['SHARES_TYPE'],
            'rank': item['HOLDER_RANK'],
            'sharehd_name': item['HOLDER_NAME'],
            'sharehd_radio': item['HOLD_NUM_RATIO'],
            'sharehd_amount': item['HOLD_NUM'],
            'change_amount': change_amount,
            'change_ratio': change_ratio,
            'date': datetime.datetime.strptime(quarter_date, '%Y-%m-%d'),
        })
    return holder_list

async def main() -> None:
    code = '301266'
    stock_name = '宇邦新材'
    holder_list = fetch_holder_list(code, stock_name)
    await save_holder_list(holder_list)
if __name__ == '__main__':
    asyncio.run(main())