# Audit Tools

**Audit Tools** é uma aplicação web desenvolvida em **Ruby on Rails 8**, utilizando **Ruby 3.3** e **PostgreSQL**.  
O objetivo do projeto é **agilizar e maximizar o agendamento, a criação de propostas e a execução de auditorias** de **todas as normas de terceira parte**.

## ✨ Principais funcionalidades

- Gestão completa de auditorias
- Agendamento inteligente e otimizado
- Criação automatizada de propostas
- Execução e acompanhamento de auditorias conforme múltiplas normas
- Sistema de **permissionamento baseado em papéis** (roles)
- **Envio de propostas por e-mail** diretamente pela plataforma
- **Emissão de PDFs em background**, garantindo performance e escalabilidade

## 🚀 Tecnologias utilizadas

- [Ruby 3.3](https://www.ruby-lang.org/)
- [Ruby on Rails 8](https://rubyonrails.org/)
- [PostgreSQL](https://www.postgresql.org/)
- [Sidekiq](https://sidekiq.org/) — processamento assíncrono em background
- [Devise](https://github.com/heartcombo/devise) — autenticação de usuários
- [CanCanCan](https://github.com/CanCanCommunity/cancancan) — controle de acesso e permissões
- [Wicked PDF](https://github.com/mileszs/wicked_pdf) — geração de PDFs
- [ActionMailer](https://guides.rubyonrails.org/action_mailer_basics.html) — envio de e-mails

## ⚙️ Instalação

1. Clone o repositório:

```bash
git clone https://github.com/seu-usuario/audit-tools.git
cd audit-tools

Instale as dependências:
bundle install
Configure o banco de dados:
rails db:create
rails db:migrate
Inicie o servidor:
rails server
Acesse o projeto em http://localhost:3000.

📄 Licença

Este projeto está sob a licença MIT.

💼 Sobre
Este projeto foi desenvolvido para facilitar auditorias de normas como ISO 9001, ISO 14001, ISO 45001 e outras normas reconhecidas internacionalmente.

---
