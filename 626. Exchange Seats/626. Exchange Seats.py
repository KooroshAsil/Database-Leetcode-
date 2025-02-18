import pandas as pd

def new_column(column):
    new_column = []
    
    if len(column) % 2 == 0:
        for i in range(0, len(column)-1, 2): 
            new_column.append(column[i+1])
            new_column.append(column[i])
            
    else:
        for i in range(0, len(column)-2, 2):
            new_column.append(column[i+1])
            new_column.append(column[i])
        new_column.append(column[-1])
        
    return new_column

def exchange_seats(seat: pd.DataFrame) -> pd.DataFrame:
    seat.student = new_column(list(seat.student))
    return seat

Seat = {
    "id": [1,2,3,4,5],
    "student": ["Abbot", "Doris", "Emerson","Green","James"]
}

seat = pd.DataFrame(Seat)
exchange_seats(seat)
print(seat)