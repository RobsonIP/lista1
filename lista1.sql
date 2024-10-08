CREATE VIEW alunos_cursos AS
SELECT a.nome, d.nome AS disciplina, c.nome AS curso
FROM aluno a
JOIN matricula m ON a.id_aluno = m.id_aluno
JOIN disciplina d ON m.id_disciplina = d.id_disciplina
JOIN curso c ON d.id_curso = c.id_curso;

CREATE VIEW total_alunos_disciplina AS
SELECT d.nome AS disciplina, COUNT(m.id_aluno) AS total_alunos
FROM disciplina d
JOIN matricula m ON d.id_disciplina = m.id_disciplina
GROUP BY d.nome;

CREATE VIEW alunos_status_matricula AS
SELECT a.nome, d.nome AS disciplina, m.status
FROM aluno a
JOIN matricula m ON a.id_aluno = m.id_aluno
JOIN disciplina d ON m.id_disciplina = d.id_disciplina;

CREATE VIEW professores_turmas AS
SELECT p.nome, d.nome AS disciplina, t.semestre, t.horario
FROM professor p
JOIN turma t ON p.id_professor = t.id_professor
JOIN disciplina d ON t.id_disciplina = d.id_disciplina;

CREATE VIEW alunos_maior_20 AS
SELECT a.nome, a.data_nascimento
FROM aluno a
WHERE TIMESTAMPDIFF(YEAR, a.data_nascimento, CURDATE()) > 20;

CREATE VIEW disciplinas_carga_horaria AS
SELECT c.nome AS curso, COUNT(d.id_disciplina) AS total_disciplinas, SUM(c.carga_horaria) AS carga_horaria_total
FROM curso c
JOIN disciplina d ON c.id_curso = d.id_curso
GROUP BY c.nome;

CREATE VIEW professores_especialidades AS
SELECT p.nome, p.especialidade
FROM professor p;

CREATE VIEW alunos_multi_disciplina AS
SELECT a.nome
FROM aluno a
JOIN matricula m ON a.id_aluno = m.id_aluno
GROUP BY a.nome
HAVING COUNT(m.id_disciplina) > 1;

CREATE VIEW alunos_disciplinas_concluidas AS
SELECT a.nome, COUNT(m.id_disciplina) AS total_disciplinas_concluidas
FROM aluno a
JOIN matricula m ON a.id_aluno = m.id_aluno
WHERE m.status = 'Concluído'
GROUP BY a.nome;

CREATE VIEW turmas_semestre AS
SELECT t.semestre, t.horario, d.nome AS disciplina, p.nome AS professor
FROM turma t
JOIN disciplina d ON t.id_disciplina = d.id_disciplina
JOIN professor p ON t.id_professor = p.id_professor
WHERE t.semestre = '2024.1';

CREATE VIEW alunos_matriculas_trancadas AS
SELECT a.nome
FROM aluno a
JOIN matricula m ON a.id_aluno = m.id_aluno
WHERE m.status = 'Trancado';

CREATE VIEW disciplinas_sem_alunos AS
SELECT d.nome
FROM disciplina d
LEFT JOIN matricula m ON d.id_disciplina = m.id_disciplina
WHERE m.id_disciplina IS NULL;

CREATE VIEW alunos_status_matricula_quantidade AS
SELECT m.status, COUNT(a.id_aluno) AS total_alunos
FROM matricula m
JOIN aluno a ON m.id_aluno = a.id_aluno
GROUP BY m.status;

CREATE VIEW professores_especialidade_quantidade AS
SELECT p.especialidade, COUNT(p.id_professor) AS total_professores
FROM professor p
GROUP BY p.especialidade;

CREATE VIEW alunos_idades AS
SELECT a.nome, TIMESTAMPDIFF(YEAR, a.data_nascimento, CURDATE()) AS idade
FROM aluno a;

CREATE VIEW alunos_ultimas_matriculas AS
SELECT a.nome, MAX(m.data_matricula) AS ultima_matricula
FROM aluno a
JOIN matricula m ON a.id_aluno = m.id_aluno
GROUP BY a.nome;

CREATE VIEW disciplinas_curso AS
SELECT d.nome
FROM disciplina d
JOIN curso c ON d.id_curso = c.id_curso
WHERE c.nome = 'Engenharia de Software';

CREATE VIEW professores_sem_turmas AS
SELECT p.nome
FROM professor p
LEFT JOIN turma t ON p.id_professor = t.id_professor
WHERE t.id_professor IS NULL;

CREATE VIEW alunos_cpf_email AS
SELECT a.nome, a.cpf, a.email
FROM aluno a;

CREATE VIEW professores_disciplinas_quantidade AS
SELECT p.nome, COUNT(d.id_disciplina) AS total_disciplinas
FROM professor p
JOIN turma t ON p.id_professor = t.id_professor
JOIN disciplina d ON t.id_disciplina = d.id_disciplina
GROUP BY p.nome;