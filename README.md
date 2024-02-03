## My RoR Blog App

<a name="readme-top"></a>
<div align="center">
    <img src="/app/assets/images/logo_jcm_md.png" alt="main-logo" width="500"  height="auto" />
  <br/>
  <h3><b>My Ruby on Rails Blog App</b></h3>
</div>
📗 Table of Contents <a name="table_of-contents"></a>

- [📗 Table of Contents](#table-of-contents)
- [📖 About project ](#about-project)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [🚀 Presentation ](#-presentation-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Install](#install)
    - [Usage](#usage)
    - [Run tests](#run-tests)
    - [Deployment](#deployment)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [❓ FAQ ](#-faq-)
  - [📝 License ](#-license-)

## 📖 About project - My Ruby on Rails Blog App <a name="about-project"></a>

The My Ruby on Rails (RoR) Blog App is a complete Blog project including a PostgreSQL database connection, user authentication, CRUD operations, user validation, testing and API usage. Tenth part: Implementing authorization rule for deleting posts and comments, by using the CanCanCan gem.

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

  <ul>
    <li><a href="https://ruby-doc.org/">Ruby v 3.2.2</a></li>
    <li><a href="https://rubyonrails.org/">Rails v 7.1.2</a></li>
    <li><a href="https://www.postgresql.org/">PostgreSQL v 16.1.1</a></li>
  </ul>

### Key Features <a name="key-features"></a>
- **Set up a Ruby on Rails project.**
- **Connect the Rails project to a PostgreSQL database.**
- **Define and set up the Data Model using Active Record migration.**
- **Implement table associations and data processing methods in the data model.**
- **Adding data validations and specs in models.**
- **Include controllers for all models. Follow the wireframe designs.**
- **Setting up specs for all controllers.**
- **Implement views for users and posts, and its corresponding comments and likes counters.**
- **Adding two web forms for creating a post and adding a comment to a post.**
- **Adding the Devise gem to our project for implementing user authentication.**
- **Implementing authorization rules for deleting posts and comments, using the CanCanCan gem.**
- **Adding endpoints: to list all posts of a user, to list all comments of a post, and to add a comment to a post.**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🚀 Presentation <a name="presentation"></a>

Not available at the moment.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

[Install Ruby](https://www.ruby-lang.org/en/documentation/installation/)

[Set Up Rails](https://www.ruby-lang.org/en/documentation/installation/)

Prerquisites: Ruby, Ruby Development Kit (for Windows), Ruby Gems packaging system, and PostgreSQL database server. Run the following commands...
```sh
$ gem install rails
```

### Setup

```sh
  cd my-folder
  git clone https://github.com/jcmunav63/my-ror-blog.git
```

### Install

This project requires the following dependencies: Ruby interpreter, Gem package manager, Ruby on Rails web framework, PostgreSQL database server, and RSpec for unit testing. Additionally, the project requires two linters checkers: RuboCop (Ruby) and Stylelint (CSS styles).

```sh
bundle install
```

### Usage

To run the project, navigate to the project directory and execute the following command:

Start the Ruby on Rails web server (Puma server) typing the following command...
```sh
  rails s , or the complete command,
  rails server
```

### Run tests

* Install the Rubocop and Stylelint linters.

Install the Rubocop linters checker using the following steps...
- First add the following code to the Gem file:
```sh
gem 'rubocop', '>= 1.0', '< 2.0'
```
- Second run the command to install dependicies in your project:
```sh
bundle install
```
- Remember to copy the .rubocop.yml file to your root directory.

gem 'rubocop', '>= 1.0', '< 2.0'

Install Stylelint linters checker using the following command...
```sh
npm install --save-dev stylelint@13.x stylelint-scss@3.x stylelint-config-standard@21.x stylelint-csstree-validator@1.x
```
- Remember to copy the .stylelintrc.json file to the root directory.

- Copy the linters.yml file inside of path .github/workflows


To run LINTERS, run the following command:

Run the following command for Ruby code...
```sh
rubocop
```

Run the following command for CSS code...
```sh
npx stylelint "**/*.{css,scss}"
```

* Implement unit tests using RSpec (pending).

### Deployment

You can deploy this project using:

Not available at the moment.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 👥 Authors <a name="authors"></a>

👤 **Juan Carlos Muñoz**

- GitHub: [@jcmunav63](https://github.com/jcmunav63)
- Twitter: [@jcmunav63](https://twitter.com/jcmunav63)
- LinkedIn: [@juan-carlos-muñoz](https://www.linkedin.com/in/juan-carlos-mu%C3%B1oz-5a15b6276/)

👤 **Julio Alejandro Quezada**

- GitHub: [Alejandroq12](https://github.com/Alejandroq12)
- Twitter: [@JulioAle54](https://twitter.com/JulioAle54)
- LinkedIn: [Julio Quezada](https://www.linkedin.com/in/quezadajulio/)

👤 **Kazim Mohammadi**
- GitHub: [@Kazim110](https://github.com/kazim110)
- Twitter: [@Kazim471](https://twitter.com/kazim471)
- LinkedIn: [@Kazim Mohammadi](https://www.linkedin.com/in/kazim-mohammadi/)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🔭 Future Features <a name="future-features"></a>

- **Add API documentation.**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ⭐️ Show your support <a name="support"></a>

If you like this project please give a star.
Thanks in advance.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank all of my colleagues who inspire me to do my best everyday.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## ❓ FAQ <a name="faq"></a>

**Did you create this project from scratch?**

  - Yes, it is a complete Ruby on Rails project for creating a web blog, with connection to an external PostgreSQL database, CRUD operations, data validation, user authentication, testing, and API usage.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
