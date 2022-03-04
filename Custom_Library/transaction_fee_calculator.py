

def calculate30PercentTransaction(withdrawal_amount):
    formatted_float = "{:.2f}".format(((float(withdrawal_amount)/100)*30))
    return formatted_float

# print(calculate30PercentTransaction(1000.00))

def after_transaction_final_withdrawal_key(val):
    val1=float(val)
    return "{:.2f}".format(float(calculate30PercentTransaction(val1))+val1)

def after_transaction_final_deposit_key(val):
    # val1=float(val)
    return "{:.2f}".format(float(val)-float(calculate30PercentTransaction(float(val))))

def get_account_balance_after_deposite(current_bal,deposite_amt):
    return "{:.2f}".format(float(deposite_amt)-(float(calculate30PercentTransaction(float(deposite_amt))))+float(current_bal))
