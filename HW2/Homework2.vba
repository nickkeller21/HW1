Attribute VB_Name = "Module1"
Sub stockstuff()
    
    For Each ws In Worksheets
  
'------------------------------------------------------------------------------------------------------------
' Declare Variables and set initital values
'------------------------------------------------------------------------------------------------------------
  
        Dim stock As String
        Dim stockTotal As Double
        stockTotal = 0
        Dim summaryRow As Long
        summaryRow = 2
        Dim LastRow As Long
        LastRow = Cells(Rows.Count, "A").End(xlUp).Row
        Dim openValue As Double
        Dim closeValue As Double
        Dim yearlyChange As Double
        Dim percentChange As Double
        openValue = Worksheets(ws.Name).Cells(2, 3).Value
        
'------------------------------------------------------------------------------------------------------------
' Set Headers
'------------------------------------------------------------------------------------------------------------
        Worksheets(ws.Name).Cells(1, 10).Value = "Stock"
        Worksheets(ws.Name).Cells(1, 11).Value = "Yearly Change"
        Worksheets(ws.Name).Cells(1, 12).Value = "Percent Change"
        Worksheets(ws.Name).Cells(1, 13).Value = "Total vol"
        
'------------------------------------------------------------------------------------------------------------
' Add Stock and Total Vol
'------------------------------------------------------------------------------------------------------------
        For i = 2 To LastRow
        
             ' Check if we are still within the same stock, if it is not...
            If Worksheets(ws.Name).Cells(i + 1, 1).Value <> Worksheets(ws.Name).Cells(i, 1).Value Then
              ' Set the Stock name
                stock = Worksheets(ws.Name).Cells(i, 1).Value
 
              ' Add to the Stock volume
                stockTotal = stockTotal + Worksheets(ws.Name).Cells(i, 7).Value
        
              ' Print the stock name in the Summary Table column j
                Worksheets(ws.Name).Cells(summaryRow, 10).Value = stock
        
              ' Print the total stock volume to the Summary Table column m
                Worksheets(ws.Name).Cells(summaryRow, 13).Value = stockTotal
        
              ' Add one to the summary table row
                summaryRow = summaryRow + 1
              
              ' Reset the stock Total
                stockTotal = 0

            ' If the cell immediately following a row is the same brand...
            Else
        
              ' Add to the stock Total
                stockTotal = stockTotal + Worksheets(ws.Name).Cells(i, 7).Value
        
            End If
            
            
'------------------------------------------------------------------------------------------------------------
' Fill Yearly Change and pecent change
'------------------------------------------------------------------------------------------------------------
            If (Worksheets(ws.Name).Cells(i + 1, 1).Value <> Worksheets(ws.Name).Cells(i, 1).Value And i > 3) Then
                closeValue = Worksheets(ws.Name).Cells(i, 6).Value
                yearlyChange = closeValue - openValue
                
                Worksheets(ws.Name).Cells(summaryRow - 1, 11).Value = yearlyChange
                openValue = Worksheets(ws.Name).Cells(i + 1, 3).Value
                
                If yearlyChange > 0 Then
                    percentChange = yearlyChange / openValue
                    Worksheets(ws.Name).Cells(summaryRow - 1, 12).Value = percentChange
                    Worksheets(ws.Name).Cells(summaryRow - 1, 11).Interior.ColorIndex = 4
                ElseIf yearlyChange < 0 Then
                    percentChange = yearlyChange / openValue
                    Worksheets(ws.Name).Cells(summaryRow - 1, 12).Value = percentChange
                    Worksheets(ws.Name).Cells(summaryRow - 1, 11).Interior.ColorIndex = 3
                Else
                    Worksheets(ws.Name).Cells(summaryRow - 1, 12).Value = 0
                End If
                Worksheets(ws.Name).Cells(summaryRow - 1, 12).NumberFormat = "0.00%"
            End If
            
                
            
        Next i
'-------------------------------------------------------------------------------------------------------------------------------
    Next ws

End Sub

Sub Change()
        For Each ws In Worksheets
  
'------------------------------------------------------------------------------------------------------------
' Declare Variables and set initital values
'------------------------------------------------------------------------------------------------------------
  
        Dim stock As String
        Dim stockTotal As Double
        stockTotal = 0
        Dim summaryRow As Long
        summaryRow = 2
        Dim LastRow As Long
        LastRow = Cells(Rows.Count, "A").End(xlUp).Row
        Dim openValue As Double
        Dim closeValue As Double
        Dim yearlyChange As Double
        Dim percentChange As Double
        openValue = Worksheets(ws.Name).Cells(2, 3).Value


'------------------------------------------------------------------------------------------------------------
' Add Stock and Total Vol
'------------------------------------------------------------------------------------------------------------
        For i = 2 To LastRow
        
             ' Check if we are still within the same stock, if it is not...
            If Worksheets(ws.Name).Cells(i + 1, 1).Value <> Worksheets(ws.Name).Cells(i, 1).Value Then
              ' Set the Stock name
                stock = Worksheets(ws.Name).Cells(i, 1).Value
 
              ' Add to the Stock volume
                stockTotal = stockTotal + Worksheets(ws.Name).Cells(i, 7).Value
        
              ' Print the stock name in the Summary Table column j
                Worksheets(ws.Name).Cells(summaryRow, 10).Value = stock
        
              ' Print the total stock volume to the Summary Table column m
                Worksheets(ws.Name).Cells(summaryRow, 13).Value = stockTotal
        
              ' Add one to the summary table row
                summaryRow = summaryRow + 1
              
              ' Reset the stock Total
                stockTotal = 0

            ' If the cell immediately following a row is the same brand...
            Else
        
              ' Add to the stock Total
                stockTotal = stockTotal + Worksheets(ws.Name).Cells(i, 7).Value
        
            End If
            
            
'------------------------------------------------------------------------------------------------------------
' Fill Yearly Change and pecent change
'------------------------------------------------------------------------------------------------------------
            If (Worksheets(ws.Name).Cells(i + 1, 1).Value <> Worksheets(ws.Name).Cells(i, 1).Value And i > 3) Then
                closeValue = Worksheets(ws.Name).Cells(i, 6).Value
                yearlyChange = closeValue - openValue
                
                Worksheets(ws.Name).Cells(summaryRow - 1, 11).Value = yearlyChange
                openValue = Worksheets(ws.Name).Cells(i + 1, 3).Value
                
                If yearlyChange > 0 Then
                    percentChange = yearlyChange / openValue
                    Worksheets(ws.Name).Cells(summaryRow - 1, 12).Value = percentChange
                    Worksheets(ws.Name).Cells(summaryRow - 1, 11).Interior.ColorIndex = 4
                ElseIf yearlyChange < 0 Then
                    percentChange = yearlyChange / openValue
                    Worksheets(ws.Name).Cells(summaryRow - 1, 12).Value = percentChange
                    Worksheets(ws.Name).Cells(summaryRow - 1, 11).Interior.ColorIndex = 3
                Else
                    Worksheets(ws.Name).Cells(summaryRow - 1, 12).Value = 0
                End If
                Worksheets(ws.Name).Cells(summaryRow - 1, 12).NumberFormat = "0.00%"
            End If
            
                
            
        Next i
'-------------------------------------------------------------------------------------------------------------------------------
    Next ws
End Sub