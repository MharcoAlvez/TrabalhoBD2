-- A criação de índices pode melhorar o desempenho das consultas, mas também pode aumentar o tempo de inserção, atualização e exclusão de registros, pois os índices precisam ser atualizados -- 

-- Exemplos de algumas otimizações que podem ser usadas quem melhoram a velocidade de consultas na tabela funcionario --
CREATE INDEX idx_numero_departamento ON funcionario (numero_departamento);
CREATE INDEX idx_cpf_supervisor ON funcionario (cpf_supervisor);
CREATE INDEX idx_salario ON funcionario (salario);

-- Exemplos de algumas otimizações que podem ser usadas quem melhoram a velocidade de consultas na tabela Projeto --
CREATE INDEX idx_nome_projeto ON projeto (nome_projeto);
CREATE INDEX idx_local_projeto ON projeto (local_projeto);




-- quando um funcionario novo for adicionado, se seu departamento for = 1, seu salario base vai ser 15000 --
DELIMITER //
CREATE TRIGGER definir_salario
BEFORE INSERT ON funcionario
FOR EACH ROW
BEGIN
    IF NEW.numero_departamento = 1 THEN
        SET NEW.salario = 15000;
    END IF;
END //
DELIMITER ;

INSERT INTO funcionario(primeiro_nome, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento )  
Values ('ze', 'ninguem', '48411203422', '1980-10-09', 'Rua do alem,373,Vila Velha, ES','M','00000', '88866555576', 1);



-- Cria uma View
CREATE VIEW View AS
SELECT CONCAT(f.primeiro_nome, " ", f.ultimo_nome) AS Funcionário, d.nome_departamento AS Departamento
FROM funcionario AS f
JOIN departamento AS d ON f.numero_departamento = d.numero_departamento
WHERE f.salario > (SELECT AVG(salario) FROM funcionario);

-- Retorna o nome do funcionário e o nome do departamento onde o salário do funcionário é maior do que a média de salários de todos os funcionários.
SELECT *
FROM View
ORDER BY Funcionário;




-- Retorna uma lista dos funcionários, seus respectivos projetos, as horas trabalhadas em cada projeto e o total de horas trabalhadas por projeto para cada funcionário.

SELECT CONCAT(f.primeiro_nome, f.ultimo_nome) AS Funcionário, p.nome_projeto AS Projeto, te.horas, SUM(te.horas) AS total_horas
FROM funcionario f
JOIN trabalha_em te ON f.cpf = te.cpf_funcionario
JOIN projeto p ON te.numero_projeto = p.numero_projeto
GROUP BY f.cpf, p.numero_projeto
ORDER BY f.primeiro_nome, f.ultimo_nome, p.nome_projeto;



-- Projeto em andamento de cada departamento.
SELECT p.numero_projeto AS 'Número do Projeto', p.nome_projeto AS 'Nome do Projeto', d.nome_departamento AS 'Nome do Departamento', ld.local AS Local, COUNT(te.cpf_funcionario) AS 'Quantidade de Funcionários', SUM(f.salario) AS 'Salário Total'
FROM projeto AS p
JOIN departamento d ON p.numero_departamento = d.numero_departamento
JOIN localizacoes_departamento ld ON d.numero_departamento = ld.numero_departamento
LEFT JOIN trabalha_em te ON p.numero_projeto = te.numero_projeto
LEFT JOIN funcionario f ON te.cpf_funcionario = f.cpf
WHERE p.numero_projeto IN (
    SELECT DISTINCT numero_projeto
    FROM trabalha_em
)
GROUP BY p.numero_projeto, p.nome_projeto, d.nome_departamento, ld.local;



-- Retorna lista dos funcionários que têm o maior salário em cada departamento
SELECT d.numero_departamento AS 'Número do Departamento', d.nome_departamento AS Departamento, CONCAT(f.primeiro_nome,' ', f.ultimo_nome) AS Funcionário, f.salario AS Salário
FROM funcionario f
JOIN departamento d ON f.numero_departamento = d.numero_departamento
WHERE f.salario = (
    SELECT MAX(salario)
    FROM funcionario
    WHERE numero_departamento = d.numero_departamento
)
ORDER BY d.numero_departamento ASC;
