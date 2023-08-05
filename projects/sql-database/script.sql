SELECT * FROM customers
LEFT JOIN invoices
ON customers.id = invoices.id
