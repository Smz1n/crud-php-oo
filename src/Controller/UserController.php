<?php

declare(strict_types=1);

namespace App\Controller;

use App\Model\User;
use App\Repository\UserRepository;
use Exception;

class UserController extends AbstractController
{
    private UserRepository $repository;

    public function __construct()
    {
        $this->repository = new UserRepository();
    }

    public function list(): void
    {
        $users = $this->repository->findAll();

        $this->render('user/list', [
            'users' => $users,
        ]);
    }

    public function add(): void
    {
        if (true === empty($_POST)) {
            $this->render('user/add');
            return;
        }

        //encriptação
        $password = password_hash($_POST['password'], PASSWORD_ARGON2I);

        $user = new User();
        $user->name = $_POST['name'];
        $user->email = $_POST['email'];
        $user->password = $password;
        $user->profile = $_POST['profile'];

        try{
            $this->repository->insert($user);
        } catch(Exception $exception) {
            if(true === str_contains($exception->getMessage(), 'email')){
                die('Email já existe');
            }
        }
     $this->redirect('/usuarios/listar');
    }
    
    public function excluir(): void
    {
        $id = $_GET['id'];
        $this->repository->excluir($id);
        $this->redirect('/usuarios/listar');
    }
}