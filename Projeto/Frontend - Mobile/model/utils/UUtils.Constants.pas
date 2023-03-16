unit UUtils.Constants;

interface

uses
  SysUtils, typinfo;

type
  TEnumCategorias = ( ctLixo = 0,  ctIluminacao, ctPavimentos, ctSinalizacao,
                     ctVegetacao, ctOutros);

Const
  ArrayCategorias : array[0..5] of String = ('lixo', 'iluminação','pavimentos',
  'sinalização','vegetação', 'outros');

  //URL_BASE            = 'http://localhost:9090';
  URL_BASE            = 'http://187.85.120.34:9090';
  URL_BASE_CIDADAO    = URL_BASE + '/v1/cidadao';
  URL_BASE_MELHORIA   = URL_BASE + '/v1/melhoria';
  URL_BASE_ACAO       = URL_BASE + '/v1/acao';
  URL_BASE_VOLUNTARIO = URL_BASE + '/v1/voluntario';


  API_SUCESSO             = 200;
  API_CRIADO              = 201;
  API_SUCESSO_SEM_RETORNO = 204;
  API_NAO_AUTORIZADO      = 401 ;



implementation

end.
