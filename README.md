# E-commerce Database Project
Este projeto apresenta a modelagem e implementação de um banco de dados lógico para um cenário de e-commerce, utilizando MySQL. O objetivo principal foi criar uma estrutura consistente para armazenar e gerenciar informações relacionadas a clientes, produtos, pedidos, pagamentos, entregas e fornecedores, aplicando boas práticas de modelagem e consultas SQL complexas.

## Funcionalidades do Banco de Dados
Clientes: Cadastro de clientes como Pessoa Física (PF) ou Jurídica (PJ).
Produtos e Estoque: Gestão de produtos com descrição, preço e quantidade disponível no estoque.
Pedidos: Registro de pedidos vinculados a clientes, contendo produtos e valores totais.
Pagamentos: Suporte a múltiplas formas de pagamento por pedido.
Entregas: Controle de status e código de rastreio para monitoramento.
Fornecedores e Vendedores: Relacionamento entre fornecedores e produtos, com a possibilidade de um vendedor também ser fornecedor.
## Estrutura
A modelagem do banco de dados foi baseada no modelo EER (Entidade-Relacionamento Estendido), incluindo relacionamentos entre entidades e a aplicação de constraints como chaves primárias, estrangeiras e validações específicas.

### Consultas Realizadas
As queries implementadas atendem a perguntas relevantes para o cenário, como:

Quantos pedidos foram feitos por cada cliente?
Algum vendedor também é fornecedor?
Relação de produtos, fornecedores e estoques.
Nomes dos fornecedores e seus produtos.
### Tecnologias Utilizadas
MySQL
SQL para criação de esquemas, inserção de dados e consultas.
