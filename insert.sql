-- Inserção de dados fictícios na tabela de Clientes
INSERT INTO Clientes (Nome, Sobrenome, Endereco, Email, Senha)
VALUES
    ('João', 'Silva', 'Rua A, 123', 'joao@email.com', 'senha123'),
    ('Maria', 'Santos', 'Avenida B, 456', 'maria@email.com', 'senha456');

-- Inserção de dados fictícios na tabela de Tortas
INSERT INTO Tortas (NomeTorta, Descricao, Preco, Categoria, UrlTorta, Disponibilidade)
VALUES
    ('Torta de Chocolate', 'Uma deliciosa torta de chocolate', 25.99, 'Doce', 'chocolate.jpg', 10),
    ('Torta de Frango', 'Uma torta de frango saborosa', 18.99, 'Salgada', 'frango.jpg', 15);

-- Inserção de dados fictícios na tabela de Bebidas
INSERT INTO Bebidas (NomeBebida, Descricao, Preco, Categoria, UrlBebida, Disponibilidade)
VALUES
    ('Refrigerante Cola', 'Refrigerante de cola gelado', 2.49, 'Refrigerante', 'cola.jpg', 100),
    ('Suco de Laranja', 'Suco natural de laranja', 3.99, 'Suco', 'laranja.jpg', 50);

-- Inserção de dados fictícios na tabela de Pedidos
INSERT INTO Pedidos (IDCliente, DateHora, StatusPedido, TotalPedido)
VALUES
    (1, NOW(), 'Em Andamento', 44.98),
    (2, NOW(), 'Entregue', 30.98);

-- Inserção de dados fictícios na tabela de Itens do Pedido
INSERT INTO ItensdoPedido (IDPedido, IDTorta, Quantidade, Preco, Subtotal)
VALUES
    (1, 1, 2, 25.99, 51.98),
    (2, 2, 1, 18.99, 18.99);

-- Inserção de dados fictícios na tabela de Bebidas do Pedido
INSERT INTO BebidasdoPedido (IDPedido, IDBebida, Quantidade, Preco, Subtotal)
VALUES
    (1, 1, 3, 2.49, 7.47),
    (2, 2, 2, 3.99, 7.98);



--Criação das Views



-- Consultar todos os pedidos, quais clientes fizeram os pedidos,
-- data e hora do pedido, status do pedido e total do pedido
CREATE VIEW ViewPedidosClientes AS
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
CREATE VIEW ViewTortasDisponiveis AS
SELECT NomeTorta, Preco
FROM Tortas
WHERE Disponibilidade > 0;

-- Consultar bebidas disponiveis com seus preços
CREATE VIEW ViewBebidasDisponiveis AS
SELECT NomeBebida, Preco
FROM Bebidas
WHERE Disponibilidade > 0;


-- Consultar pedidos de um cliente específico
CREATE VIEW ViewPedidosCliente1 AS
SELECT 
    C.Nome,
    P.IDPedido, 
    P.DateHora, 
    P.StatusPedido, 
    P.TotalPedido
FROM Pedidos AS P
JOIN Clientes AS C ON P.IDCliente = C.IDCliente
WHERE P.IDCliente = 1;


-- Contar a quantidade de pedidos por status
CREATE VIEW ViewQuantidadePedidosPorStatus AS
SELECT StatusPedido, COUNT(*) AS TotalPedidos
FROM Pedidos
GROUP BY StatusPedido;

SELECT * FROM ViewPedidosClientes;
SELECT * FROM ViewTortasDisponiveis;
SELECT * FROM ViewBebidasDisponiveis;
SELECT * FROM ViewPedidosCliente1;
SELECT * FROM ViewQuantidadePedidosPorStatus;
