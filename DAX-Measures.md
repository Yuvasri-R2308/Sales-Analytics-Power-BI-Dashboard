Net Sales = 
SUMX(
    OrderDetails,
    OrderDetails[Quantity] *
    RELATED(Products[UnitPrice]) *
    (1 - RELATED(Products[Discount]) / 100)
)

Total Sales = SUM(Orders[OrderAmount])

Completed Orders = 
CALCULATE(
    COUNTROWS(Orders),
    Orders[Status] = "Completed"
)

Pending Orders = 
CALCULATE(
    COUNTROWS(Orders),
    Orders[Status] = "Pending"
)

Customers with Orders =
DISTINCTCOUNT(Orders[CustomerID])
