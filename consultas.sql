-- Consultar todos os pedidos, quais clientes fizeram os pedidos,
-- data e hora do pedido, status do pedido e total do pedido
SELECT
    P.IDPedido,
    C.Nome AS NomeCliente,
    C.Sobrenome AS SobrenomeCliente,
    P.DateHora AS DataHoraPedido,
    P.StatusPedido,
    P.TotalPedido
FROM Pedidos AS P
JOIN Clientes AS C ON P.IDCliente = C.IDCliente;

-- Consultar as tortas disponiveis com seus preços
SELECT NomeTorta, Preco
FROM Tortas
WHERE Disponibilidade > 0;

-- Consultar bebidas disponiveis com seus preços
SELECT NomeBebida, Preco
FROM Bebidas
WHERE Disponibilidade > 0;

-- Consultar pedidos de um cliente específico
SELECT 
    C.Nome,
    P.IDPedido, 
    P.DateHora, 
    P.StatusPedido, 
    P.TotalPedido
FROM Pedidos AS P
JOIN Clientes as C
WHERE P.IDCliente = 1;

-- Contar a quantidade de pedidos por status
SELECT StatusPedido, COUNT(*) AS TotalPedidos
FROM Pedidos
GROUP BY StatusPedido;