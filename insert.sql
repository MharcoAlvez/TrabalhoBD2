INSERT INTO funcionario(primeiro_nome, ultimo_nome, cpf, data_nascimento, endereco, sexo, salario, cpf_supervisor, numero_departamento )  
VALUES ('Matheus', 'Lopes', '88866555576', '1980-10-10', 'Rua do Perim,373,Vila Velha, ES','M','55000', '88866555576', 1),
('Cristopher', 'Thompson', '77777777777', '1986-02-02','Rua da Praia, 12, Vila Velha, ES', 'M', '31000', '88866555576', 3 ),
('Vitor', 'Lugon', '99999999999', '1990-12-12','Rua da UVV, 11, Vila Velha, ES', 'M', '40000', '88866555576', 1 ),
('Paulo', 'Andre', '88888888888', '1986-01-01','Rua do Shopping, 11, Vila Velha, ES', 'M', '30000', '88866555576', 2 ),
("Paul","Clark","73629099548","1986-05-30","9190 Nonummy Rd.","M","10000","88866555576",1),   
("Kyle","Brewer","96632023254","1989-03-25","P.O. Box 483, 2271 Cursus. Road","M","20000","88888888888",2),   
("Christian","Cabrera","26456088709","1978-06-12","7634 Duis Ave","M","20000","88888888888",2),   
("Urielle","Henderson","48411203423","1987-07-22","150-9791 Class Street","F","30000","77777777777",3),   
("Alea","Lewis","35622446360","1983-03-18","Ap #894-3239 Eu St.","F","20000","88888888888", 2);

INSERT INTO dependente(cpf_funcionario, nome_dependente, sexo, data_nascimento, parentesco) 
VALUES  ("26456088709","Martena","F","1984-01-01","esposa"),   
("73629099548", "Isadora", "F", "1981-02-27", "esposa"),   
("77777777777","Libby","F", "1976-04-15", "esposa"),   
("88866555576","Maggie","F","1983-09-26,","esposa"),   
("35622446360","Isaiah","M","1975-08-16","marido"),   
("48411203423","Ramona","F", "2020-06-22", "filha"),   
("88888888888", "Vivian","F","2011-07-08", "filha"),   
("96632023254","Zia","F","2006-09-14", "filha"),   
("99999999999","Wanda","F","2017-11-07","filha");

INSERT INTO departamento(numero_departamento, nome_departamento,cpf_gerente, data_inicio_gerente) 
VALUES (1,"administrativo", 99999999999, "2006-02-07"), 
(2,"financeiro", 88888888888, "2013-06-04"), 
(3,"pessoal", 77777777777, "2016-09-20");	

INSERT INTO projeto(numero_projeto, nome_projeto, local_projeto, numero_departamento) 
VALUES (10,'Banco Dados', 'Predio Rosa', 1), 
(20, 'Dev. Sofwtare', 'Predio Azul', 2), 
(30, 'I.A', 'Predio branco', 3);
  
INSERT INTO trabalha_em(cpf_funcionario, horas, numero_projeto) 
VALUES (26456088709, "16.0", 20),   
(35622446360,"13.0", 20),   
(48411203423, "21.0", 30),   
(73629099548,"10.0", 10),   
(77777777777,"20.0", 30),  
(88866555576,"10.0", 10),   
(88888888888,"12.0", 20),   
(96632023254,"17.0", 20),   
(99999999999,"10.0", 10);

INSERT INTO localizacoes_departamento(numero_departamento, local)
VALUES (1, "Predio Rosa"),
(2, "Predio Azul"),
(3, "Predio branco");
