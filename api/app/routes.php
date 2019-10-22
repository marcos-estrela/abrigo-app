<?php
declare(strict_types=1);

use Psr\Http\Message\ResponseInterface as Response;
use Psr\Http\Message\ServerRequestInterface as Request;
use Slim\App;
use Slim\Interfaces\RouteCollectorProxyInterface as Group;
use Slim\Exception\HttpNotFoundException;


return function (App $app) {

    $app->options('/{routes:.+}', function ($request, $response, $args) {
        return $response;
    });

    $app->add(function ($request, $handler) {
        $response = $handler->handle($request);
        return $response
            ->withHeader('Access-Control-Allow-Origin', 'http://mysite')
            ->withHeader('Access-Control-Allow-Headers', 'X-Requested-With, Content-Type, Accept, Origin, Authorization')
            ->withHeader('Access-Control-Allow-Methods', 'GET, POST, PUT, DELETE, PATCH, OPTIONS');
    });

    $app->group('/api', function (Group $group){

        // Group de Animais
        $group->group('/animais', function (Group $group) {
            $group->get('/listar_animais', function ($request, $response, $args) {
                $stmt = $this->get(PDO::class)->query("select * from view_animais");
                $return = $stmt->fetchAll();
                $response->getBody()->write(json_encode($return));
                return $response;
            });
            $group->put('/atualizar_animal/{id}', function ($request, $response, $args) {
                $params = $request->getParsedBody();
                if(isset($params['raca'])) {
                    if (!isset($params['raca']['value'])) {
                        // Caso tenha o campo raca e não tenha o atributo value, é sinal que é uma nova inserção
                        $dbh = $this->get(PDO::class);
                        $stmt = $dbh->prepare("CALL inserir_raca(?,@status,@mensagem);");

                        // Parâmetros de entrada (IN)
                        $stmt->bindParam(1, $params['raca']);
                        $stmt->execute();
                        $stmt->closeCursor();

                        $lastInsertId = $dbh->query('SELECT LAST_INSERT_ID() AS id')->fetch()['id'];
                        $output = $this->get(PDO::class)->query("select @status as status, @mensagem as mensagem")->fetch(PDO::FETCH_ASSOC);

                        if ($output['status'] == 0) {
                            $response->getBody()->write(json_encode($output));
                            return $response;
                        }
                        else{
                            $raca = $lastInsertId;
                        }
                    }
                    else {
                        if($params['raca']['value'] != null){
                            $raca = $params['raca']['value'];
                        }
                        else{
                            $raca = null;
                        }
                    }
                }
                else{
                    $raca = null;
                }

                $id               = $args['id'];

                $nome             = (isset($params['nome_animal']) ? $params['nome_animal'] : null);
                $numero_chip      = (isset($params['numero_chip']) ? $params['numero_chip'] : null);
                $sexo             = (isset($params['sexo']) ? $params['sexo'] : null);
                $especie_codigo   = (isset($params['especie_codigo']) ? $params['especie_codigo'] : null);
                $data_nascimento  = (isset($params['data_nascimento']) ? $params['data_nascimento'] : null);
                $data_falecimento = (isset($params['data_falecimento']) ? $params['data_falecimento'] : null);

                $stmt = $this->get(PDO::class)->prepare("CALL atualizar_animal(?,?,?,?,?,?,?,?,@status,@mensagem)");

                // Parâmetros de entrada (IN)
                $stmt->bindParam(1, $id);
                $stmt->bindParam(2, $nome);
                $stmt->bindParam(3, $numero_chip);
                $stmt->bindParam(4, $raca);
                $stmt->bindParam(5, $sexo);
                $stmt->bindParam(6, $especie_codigo);
                $stmt->bindParam(7, $data_nascimento);
                $stmt->bindParam(8, $data_falecimento);

                $stmt->execute();
                $stmt->closeCursor();

                $output = $this->get(PDO::class)->query("select @status as status, @mensagem as mensagem")->fetch(PDO::FETCH_ASSOC);
                $response->getBody()->write(json_encode($output));
                return $response;
            });
            $group->post('/inserir_animal', function ($request, $response, $args) {
                $params = $request->getParsedBody();
                if(isset($params['raca'])) {
                    if (!isset($params['raca']['value'])) {
                        // Caso tenha o campo raca e não tenha o atributo value, é sinal que é uma nova inserção
                        $dbh = $this->get(PDO::class);
                        $stmt = $dbh->prepare("CALL inserir_raca(?,@status,@mensagem);");

                        // Parâmetros de entrada (IN)
                        $stmt->bindParam(1, $params['raca']);
                        $stmt->execute();
                        $stmt->closeCursor();

                        $lastInsertId = $dbh->query('SELECT LAST_INSERT_ID() AS id')->fetch()['id'];
                        $output = $this->get(PDO::class)->query("select @status as status, @mensagem as mensagem")->fetch(PDO::FETCH_ASSOC);

                        if ($output['status'] == 0) {
                            $response->getBody()->write(json_encode($output));
                            return $response;
                        }
                        else{
                            $raca = $lastInsertId;
                        }
                    }
                    else {
                        if($params['raca']['value'] != null){
                            $raca = $params['raca']['value'];
                        }
                        else{
                            $raca = null;
                        }
                    }
                }
                else{
                    $raca = null;
                }

                $nome             = (isset($params['nome_animal']) ? $params['nome_animal'] : null);
                $numero_chip      = (isset($params['numero_chip']) ? $params['numero_chip'] : null);
                $sexo             = (isset($params['sexo']) ? $params['sexo'] : null);
                $especie_codigo   = (isset($params['especie_codigo']) ? $params['especie_codigo'] : null);
                $data_nascimento  = (isset($params['data_nascimento']) ? $params['data_nascimento'] : null);

                $stmt = $this->get(PDO::class)->prepare("CALL inserir_animal(?,?,?,?,?,?,@status,@mensagem)");

                // Parâmetros de entrada (IN)
                $stmt->bindParam(1, $nome);
                $stmt->bindParam(2, $numero_chip);
                $stmt->bindParam(3, $raca);
                $stmt->bindParam(4, $sexo);
                $stmt->bindParam(5, $especie_codigo);
                $stmt->bindParam(6, $data_nascimento);

                $stmt->execute();
                $stmt->closeCursor();

                $output = $this->get(PDO::class)->query("select @status as status, @mensagem as mensagem")->fetch(PDO::FETCH_ASSOC);

                $response->getBody()->write(json_encode($output));
                return $response;
            });
        });

        // Group de Raças
        $group->group('/racas', function (Group $group) {
            $group->get('/listar_racas', function ($request, $response, $args) {
                $stmt = $this->get(PDO::class)->query("select * from view_racas");
                $return = $stmt->fetchAll();
                $response->getBody()->write(json_encode($return));
                return $response;
            });
        });
    });

    $app->get("/", function (Request $request, Response $response) {
        $response->getBody()->write('Hello world!');
        return $response;
    });

    $app->map(['GET', 'POST', 'PUT', 'DELETE', 'PATCH'], '/{routes:.+}', function ($request, $response) {
        throw new HttpNotFoundException($request);
    });
};
