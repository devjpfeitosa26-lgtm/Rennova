-- Renovva — migração v3 (rode DEPOIS do migration_v2.sql)
-- Substitui o ciclo de 8 devocionais por um ciclo completo de 31 dias
-- (janeiro inteiro de "Morning and Evening", de C. H. Spurgeon — obra em
-- domínio público desde 1892 — traduzido livremente para este projeto).

delete from devotionals;

insert into devotionals (day_index, title, author, source, scripture_ref, scripture_text, body) values

(1, $$O fruto da nova terra$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Josué 5:12', $$Comeram do fruto da terra de Canaã naquele ano.$$, $$As fatigantes peregrinações de Israel haviam terminado, e o descanso prometido fora alcançado. Não mais tendas errantes, serpentes ardentes, inimigos ferozes e desertos uivantes: eles chegaram à terra que mana leite e mel, e comeram do trigo antigo da terra.

Talvez este ano, querido leitor, seja também o seu caso, ou o meu. A perspectiva é alegre, e se a fé estiver em exercício ativo, ela produzirá um deleite genuíno. Estar com Jesus no descanso que resta para o povo de Deus é, de fato, uma esperança animadora.

Colheremos este ano frutos celestiais em solo terreno, onde a fé e a esperança transformaram o deserto no jardim do Senhor. Ó, que a graça nos faça alimentar de Jesus, e assim comer do fruto da terra nova este ano!$$),

(2, $$Continuar em oração$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Colossenses 4:2', $$Perseverai na oração.$$, $$É interessante notar como grande parte das Escrituras trata do tema da oração — seja em exemplos, mandamentos ou promessas. Mal abrimos a Bíblia e já lemos: "Então os homens começaram a invocar o nome do Senhor"; e quase no fechar do livro, o "amém" de uma súplica sincera ainda ecoa. Os exemplos são muitos: um Jacó lutando, um Daniel orando três vezes ao dia, um Davi que buscava a Deus de todo o coração.

O que isso nos ensina, senão a importância sagrada da oração? Podemos ter certeza de que tudo o que Deus destacou em sua Palavra, ele pretendeu que fosse evidente em nossa vida. Se ele falou tanto sobre oração, é porque sabe que dela temos grande necessidade. Tão profundas são as nossas carências que, enquanto não estivermos no céu, não devemos deixar de orar.

Uma alma sem oração é uma alma sem Cristo. A oração é o balbucio da criança que crê, o grito do lutador que combate, o último suspiro do santo que adormece em Jesus. É o fôlego, a senha, o conforto, a força, a honra do cristão.$$),

(3, $$Tudo o que Cristo tem é teu$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Isaías 49:8', $$Eu te dei por aliança do povo.$$, $$Jesus Cristo é ele mesmo a soma e a substância da aliança, e um dos seus dons. Ele é propriedade de todo crente. Consegues avaliar o que ganhaste em Cristo? "Nele habita corporalmente toda a plenitude da Divindade." Tudo o que Cristo, como Deus e como homem, teve ou pode ter, é teu — por pura graça, passado a ti como herança eterna.

Tem ele poder? Esse poder é teu, para te sustentar e fortalecer, vencer teus inimigos e te preservar até o fim. Tem ele amor? Não há uma gota de amor em seu coração que não seja tua; podes mergulhar no oceano imenso do seu amor e dizer de tudo: "é meu."

E tudo o que ele tem como homem perfeito também é teu. A aceitação de Cristo por Deus é a tua aceitação; pois o amor que o Pai depositou num Cristo perfeito, ele agora deposita em ti. Aquela justiça perfeita que ele operou é tua, e te é imputada.$$),

(4, $$Crescer na graça$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', '2 Pedro 3:18', $$Crescei na graça e no conhecimento de nosso Senhor e Salvador Jesus Cristo.$$, $$"Crescei na graça" — não em uma graça apenas, mas em toda graça. Cresce naquela graça-raiz, a fé. Crê nas promessas com mais firmeza do que já creste. Cresce também no amor: que se torne mais amplo, mais intenso, mais prático, influenciando cada pensamento, palavra e ação.

Cresce igualmente na humildade — procura te colocar bem baixo, e conhecer mais a tua própria pequenez. Ao crescer para baixo em humildade, procura também crescer para cima, com aproximações mais próximas de Deus na oração e comunhão mais íntima com Jesus.

Aquele que não cresce no conhecimento de Jesus recusa-se a ser abençoado. Conhecê-lo é "vida eterna", e avançar nesse conhecimento é crescer em felicidade. Quem já provou este vinho terá sede de mais, pois, embora Cristo satisfaça, é uma satisfação tal que não entedia o apetite, mas o aguça.$$),

(5, $$A luz que Deus separa$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Gênesis 1:4', $$E viu Deus que a luz era boa; e fez Deus separação entre a luz e as trevas.$$, $$A luz bem poderia ser boa, pois brotou daquela ordem de bondade: "Haja luz." Nós, que a desfrutamos, deveríamos ser mais gratos por ela, e ver mais de Deus nela e por meio dela. A luz física é doce; mas a luz do evangelho é infinitamente mais preciosa, pois revela coisas eternas e alimenta a nossa natureza imortal.

Quando o Espírito Santo nos dá luz espiritual e abre os nossos olhos para contemplar a glória de Deus na face de Jesus Cristo, vemos o pecado em suas verdadeiras cores, e a nós mesmos em nossa real condição. Senhor, já que a luz é tão boa, dá-nos mais dela, e mais de ti mesmo, a verdadeira luz.

Assim que existe uma coisa boa no mundo, uma separação se faz necessária. Luz e trevas não têm comunhão; Deus as separou, não as confundamos nós. Ó Senhor Jesus, sê tu a nossa luz durante todo este dia, pois a tua luz é a luz dos homens.$$),

(6, $$Ele tem cuidado de ti$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', '1 Pedro 5:7', $$Lançando sobre ele toda a vossa ansiedade, porque ele tem cuidado de vós.$$, $$É um jeito feliz de suavizar a dor quando podemos sentir: "Ele tem cuidado de mim." Cristão, não desonres a fé sempre carregando uma testa de preocupação; vem, lança o teu fardo sobre o teu Senhor. Estás cambaleando sob um peso que o teu Pai sequer sentiria.

Ó filho do sofrimento, sê paciente; Deus não te esqueceu em sua providência. Aquele que alimenta os pardais também te proverá do que precisas. Não te sentes em desespero; espera sempre. Há Alguém que cuida de ti. Os olhos dele estão fixos em ti, o coração dele bate com piedade pela tua dor, e a sua mão onipotente ainda te trará o socorro necessário.

A nuvem mais escura se dissolverá em chuvas de misericórdia. A treva mais espessa dará lugar à manhã. Se Deus cuida de ti, por que haverias também de te afligir com cuidado? Ele nunca se recusou a carregar os teus fardos, nunca desfaleceu sob o peso deles.$$),

(7, $$Viver é Cristo$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Filipenses 1:21', $$Porque para mim o viver é Cristo, e o morrer é ganho.$$, $$O crente nem sempre viveu para Cristo. Ele começou a fazê-lo quando o Espírito Santo o convenceu do pecado, e quando, pela graça, foi levado a ver o Salvador moribundo fazendo propiciação pela sua culpa. Desde o momento do novo nascimento, o homem começa a viver para Cristo.

Jesus é, para os crentes, a única pérola de grande valor, pela qual estamos dispostos a abrir mão de tudo o que temos. Ele conquistou de tal forma o nosso amor que este bate apenas por ele; para a sua glória queremos viver, e em defesa do seu evangelho queremos morrer.

Podes tu dizer, como cristão professo, que vives à altura dessa ideia? Podes dizer honestamente que, para ti, viver é Cristo? Esta é a verdadeira vida do cristão — sua origem, seu sustento, sua forma, seu fim — tudo reunido em uma palavra: Cristo Jesus.$$),

(8, $$A iniquidade em nossa santidade$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Êxodo 28:38', $$A iniquidade das coisas santas.$$, $$Que véu se levanta com estas palavras, e que revelação se faz! Será humilhante, mas proveitoso, pararmos um instante e ver essa triste cena. As iniquidades do nosso culto público — sua hipocrisia, formalismo, tibieza, irreverência, vagueio do coração e esquecimento de Deus — que medida cheia temos ali!

Nossas devoções privadas, seu relaxamento, frieza, negligência, sonolência e vaidade — que montanha de terra morta há ali! Se olhássemos com mais cuidado, encontraríamos essa iniquidade ainda maior do que parece à primeira vista. Até os nossos desejos de santidade podem estar contaminados por más motivações.

Como é animador pensar que, quando o Sumo Sacerdote carregava a iniquidade das coisas santas, ele trazia na testa as palavras: "SANTIDADE AO SENHOR"; e assim também, enquanto Jesus carrega o nosso pecado, ele apresenta diante da face do Pai não a nossa impureza, mas a sua própria santidade.$$),

(9, $$Eu serei o teu Deus$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Jeremias 31:33', $$Eu serei o seu Deus.$$, $$Cristão! Aqui está tudo o que precisas. Para seres feliz, precisas de algo que te satisfaça plenamente — e não é isto suficiente? Se puderes guardar esta promessa no coração, não dirás, como Davi: "O meu cálice transborda; tenho mais do que o coração pode desejar"?

O desejo humano é insaciável, mas aquele que enche todas as coisas pode enchê-lo. Quem pode medir a capacidade dos nossos anseios? Mas a riqueza de Deus pode transbordá-la ainda mais. Não estás completo quando Deus é teu? Precisas de algo além dele?

Vive à altura dos teus privilégios, e regozija-te com alegria genuína.$$),

(10, $$Uma coroa reservada$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', '2 Timóteo 4:8', $$Está depositada para mim uma coroa de justiça.$$, $$Alma que duvidas: já disseste tantas vezes "temo nunca entrar no céu." Não temas! Todo o povo de Deus há de entrar ali. Amo o dito singelo de um moribundo que exclamou: "Não tenho medo de ir para casa; já enviei tudo à frente; o dedo de Deus está na tranca da minha porta, e estou pronto para que ele entre."

"Há um trono no céu que nem o apóstolo Paulo poderia ocupar; foi feito para mim, e eu o terei." Ó cristão, que pensamento cheio de alegria! Tua porção está segura; "resta um descanso." Se sou filho de Deus, não o perderei. É meu tão seguramente como se eu já estivesse lá.

Nenhum outro terá a tua porção; está reservada no céu para ti, e a terás em breve, pois não haverá tronos vazios na glória quando todos os escolhidos estiverem reunidos.$$),

(11, $$Raízes que não secam$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Lucas 8:13', $$Estes não têm raiz.$$, $$Minha alma, examina-te hoje à luz deste texto. Recebeste a palavra com alegria; teus sentimentos foram tocados. Mas lembra-te: receber a palavra pelo ouvido é uma coisa, e receber Jesus na própria alma é outra bem diferente; um sentimento superficial anda muitas vezes junto de uma dureza interior de coração, e uma impressão viva da palavra nem sempre é duradoura.

Na parábola, a semente caiu sobre um terreno com fundo rochoso, coberto por uma fina camada de terra; quando começou a lançar raízes, seu crescimento foi impedido pela pedra dura, e por isso gastou sua força empurrando o broto verde para o alto — mas, sem umidade interior vinda da raiz, secou. Será este o meu caso?

O bom crescimento acontece para cima e para baixo ao mesmo tempo. Estou enraizado em fidelidade sincera e amor por Jesus? Ó semeador celeste, lavra-me primeiro, e depois lança a verdade em mim, e deixa que eu te dê uma colheita abundante.$$),

(12, $$Vós sois de Cristo$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', '1 Coríntios 3:23', $$Vós sois de Cristo.$$, $$"Vós sois de Cristo." Sois dele por doação, pois o Pai vos deu ao Filho; dele pela compra do seu sangue, pois ele pagou o preço da vossa redenção; dele por dedicação, pois vos consagrastes a ele; dele por relação, pois sois chamados pelo seu nome, feitos irmãos e coerdeiros.

Trabalhai para mostrar ao mundo, na prática, que sois o servo, o amigo, a noiva de Jesus. Quando tentado a pecar, responde: "Não posso cometer esta grande maldade, pois sou de Cristo." Estás exposto a dificuldades e perigos? Permanece firme no dia mau, lembrando que és de Cristo.

Quando o cântico sedutor do prazer tentar te desviar do caminho certo, responde: "Tua música não me encanta; sou de Cristo." Nunca desminta a tua profissão de fé.$$),

(13, $$Navios quebrados, coração sereno$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', '1 Reis 22:48', $$E os navios se quebraram.$$, $$Os navios de Salomão voltaram em segurança, mas os navios de Josafá nunca chegaram à terra do ouro. A providência prospera um e frustra o desejo de outro, no mesmo negócio e no mesmo lugar; ainda assim, o Grande Soberano é tão bom e sábio numa hora quanto na outra.

Que tenhamos hoje graça para bendizer o Senhor pelos navios quebrados, tanto quanto pelos navios carregados de bênçãos terrenas; que não invejemos os mais bem-sucedidos, nem murmuremos contra nossas perdas. Como Josafá, podemos ser preciosos aos olhos do Senhor, ainda que nossos planos terminem em decepção.

A causa secreta da perda de Josafá bem merece ser notada: foi a sua aliança com companhias erradas. Ó, que tenhamos tal amor a Jesus que, como ele, sejamos santos, inofensivos, imaculados e separados daquilo que nos corrompe.$$),

(14, $$Poderoso para salvar$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Isaías 63:1', $$Poderoso para salvar.$$, $$Pelas palavras "para salvar" entendemos toda a grande obra da salvação, desde o primeiro desejo santo até a completa santificação. Cristo não é apenas "poderoso para salvar" os que se arrependem — ele é capaz de levar os homens ao arrependimento. Ele é, além disso, poderoso para dar aos homens corações novos e operar neles a fé.

A vida do crente é uma série de milagres operados por Deus. Ele é poderoso para manter o seu povo firme depois de tê-lo levantado, e para preservá-lo até consumar a sua obra na eternidade. O poder de Cristo não está em começar algo e depois deixar que nos viremos sozinhos; aquele que começa a boa obra a leva adiante.

Crente, aqui está o encorajamento. Estás orando por alguém amado? Ó, não desistas das tuas orações, pois Cristo é "poderoso para salvar."$$),

(15, $$Faze como disseste$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', '2 Samuel 7:25', $$Faze, pois, agora, ó Senhor Deus, o que disseste.$$, $$As promessas de Deus nunca foram feitas para serem jogadas de lado como papel velho; ele pretendia que fossem usadas. Nada agrada mais ao nosso Senhor do que ver suas promessas em circulação; ele ama ver seus filhos as trazendo de volta a ele, dizendo: "Senhor, faze como disseste."

Glorificamos a Deus quando invocamos as suas promessas. Pensas que Deus ficará mais pobre por te dar as riquezas que prometeu? A fé se apega à promessa, e não hesita dizendo "será que é verdadeira?", mas vai direto ao trono com ela, e roga: "Senhor, aqui está a promessa: faze como disseste."

Quando um cristão agarra uma promessa, se não a leva a Deus, ele o desonra; mas quando se apressa ao trono da graça, então o seu desejo será concedido. Nunca deixes a promessa enferrujar.$$),

(16, $$Eu te ajudarei$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Isaías 41:14', $$Eu te ajudarei, diz o Senhor.$$, $$Hoje, ouçamos o Senhor falar a cada um de nós: "Eu te ajudarei." "É pouca coisa, para mim, ajudar-te. Considera o que já fiz por ti. Eu te comprei com o meu sangue; morri por ti — e se fiz o maior, não farei o menor? Ajudar-te é a menor coisa que ainda farei por ti; já fiz mais, e farei mais."

"Antes que o mundo existisse, eu te escolhi. Deixei de lado a minha glória por ti; entreguei a minha vida por ti; e se fiz tudo isso, certamente te ajudarei agora."

O Deus eterno é o teu ajudador — hoje, de novo.$$),

(17, $$Eis o Cordeiro$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Apocalipse 14:1', $$E olhei, e eis um Cordeiro em pé sobre o monte Sião.$$, $$O apóstolo João teve o privilégio de olhar para dentro dos portões do céu, e ao descrever o que viu, começa dizendo: "Olhei, e eis um Cordeiro!" O principal objeto de contemplação no estado celestial é "o Cordeiro de Deus, que tira o pecado do mundo."

Cristão, aqui está alegria para ti; olhaste, e viste o Cordeiro. Através das tuas lágrimas, teus olhos viram o Cordeiro de Deus tirando o teu pecado. Alegra-te, então. Em breve verás o mesmo Cordeiro exaltado em seu trono.

Como bem disse um antigo santo, "céu e Cristo são a mesma coisa"; estar com Cristo é estar no céu, e estar no céu é estar com Cristo. Tudo o que precisas para ser bem-aventurado é "estar com Cristo."$$),

(18, $$O descanso que resta$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Hebreus 4:9', $$Portanto, resta um descanso para o povo de Deus.$$, $$Como será diferente o estado do crente no céu, comparado com o que é aqui! Aqui, ele nasce para o labor e conhece o cansaço. Ansioso por servir ao seu Mestre, ele encontra sua força inferior ao seu zelo; seu clamor constante é: "Ajuda-me a te servir, ó meu Deus."

Ah, cristão, o dia quente do cansaço não dura para sempre; o sol se aproxima do horizonte; ele nascerá de novo, num dia mais brilhante do que qualquer um que já viste. Aqui, o cristão está sempre inquieto; sente que ainda não alcançou. Lá, todos descansam; alcançaram o topo do monte.

Ah, trabalhador cansado, pensa apenas no que será descansar para sempre! É um descanso eterno; um descanso que "permanece". Dia feliz! feliz, quando a mortalidade for tragada pela vida, e o Eterno Sábado começar.$$),

(19, $$Onde perdeste o caminho$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Cântico dos Cânticos 3:1', $$Busquei-o, mas não o achei.$$, $$Diz-me onde perdeste a paz, e eu te direi o lugar mais provável para encontrá-la de novo. Perdeste-a por teres deixado de orar? Então é ali que deves buscá-la. Perdeste-a pelo erro que cometeste? Não a encontrarás de outra forma senão reconhecendo o erro e buscando, com ajuda, deixar para trás aquilo que te derruba.

É um ditado verdadeiro: procura uma coisa onde a deixaste cair, pois é ali que ela está. É trabalho árduo voltar atrás — mas busca de todo o coração, entrega-te inteiramente à busca, e em verdade encontrarás de novo o teu caminho, para tua alegria.

Não podes lembrar aquele momento em que foste encontrado e ouviste: "Vem"? Vai, então, e busca de novo, de todo o coração.$$),

(20, $$O primeiro pastor$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Gênesis 4:2', $$Abel foi pastor de ovelhas.$$, $$Como pastor, Abel santificou seu trabalho para a glória de Deus, e ofereceu um sacrifício sobre o seu altar, e o Senhor atentou para Abel e sua oferta. Ao vermos Abel, pastor e ao mesmo tempo sacerdote, oferecendo um sacrifício de aroma suave a Deus, discernimos o nosso Senhor, que apresenta diante de seu Pai um sacrifício ao qual Jeová sempre atenta.

Abel foi odiado por seu irmão — odiado sem causa; e assim também foi o Salvador. Abel caiu, e aspergiu seu altar com seu próprio sangue, prefigurando o Senhor Jesus, morto enquanto servia como sacerdote diante do Senhor. "O bom Pastor dá a sua vida pelas ovelhas."

O sangue de Jesus tem uma voz muito mais poderosa que o de Abel, e o teor do seu clamor predominante não é vingança, mas misericórdia.$$),

(21, $$Nenhum será deixado para trás$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Romanos 11:26', $$E assim todo o Israel será salvo.$$, $$Quando Moisés cantou junto ao Mar Vermelho, sua alegria era saber que todo o Israel estava a salvo. Nenhuma gota daquela parede de água caiu até que o último do Israel de Deus tivesse plantado o pé em segurança do outro lado. Só então as águas voltaram ao seu lugar — não antes.

Assim como todos os que Deus escolheu, todos os que Cristo redimiu, todos os que creem em Jesus atravessarão em segurança o mar que os divide. Nem todos chegamos ainda em segurança à outra margem: parte já cruzou, e parte está atravessando agora.

Tenhamos bom ânimo: os últimos dos escolhidos logo terão cruzado o mar, e então se ouvirá o cântico do triunfo, quando todos estiverem seguros.$$),

(22, $$Nada temos de nós mesmos$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Ezequiel 15:2', $$Que mais é a videira do que qualquer outra árvore?$$, $$Estas palavras servem para humilhar o povo de Deus; eles são chamados de videira de Deus, mas o que são eles, por natureza, mais do que os outros? Tornaram-se frutíferos pela bondade de Deus, tendo sido plantados em bom solo. Mas o que são eles sem o seu Deus?

Ó crente, aprende a rejeitar o orgulho, vendo que não tens fundamento algum para ele. Quanto mais tens, mais devedor és a Deus. Considera a tua origem; olha para trás, para o que eras. Considera o que serias sem a graça divina.

Grande crente, terias sido um grande pecador se Deus não te tivesse feito diferente. Portanto, não te ensoberbeças — pois não tinhas antes uma única coisa para chamar de tua, exceto o teu pecado e a tua miséria.$$),

(23, $$Um irmão escolhido dentre o povo$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Salmo 89:19', $$Exaltei um escolhido dentre o povo.$$, $$Por que Cristo foi escolhido dentre o povo? Não seria para que pudesse ser o nosso irmão, no doce vínculo do sangue? O crente pode dizer: "Tenho um Irmão no céu; posso ser pobre, mas tenho um Irmão que é rico, e é Rei — e ele permitiria que eu passasse necessidade enquanto está em seu trono? Não! Ele me ama; ele é meu Irmão."

Cristo também foi escolhido dentre o povo para que conhecesse as nossas necessidades e simpatizasse conosco. Tentação, dor, decepção, fraqueza, cansaço, pobreza — ele conhece tudo isso, pois sentiu tudo isso.

Lembra-te disso, e que isso te console. Cada fardo que temos de carregar já foi, uma vez, colocado sobre os ombros de Emanuel.$$),

(24, $$Livre do laço$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Salmo 91:3', $$Certamente ele te livrará do laço do passarinheiro.$$, $$Deus livra o seu povo do laço do passarinheiro de duas formas: livra-o de entrar no laço, e, se caírem nele, livra-o dele. A aflição é muitas vezes o meio pelo qual Deus nos livra; a nossa tribulação pode ser o meio de nos livrar de um mal muito maior.

Mas que coisa abençoada é que, se o crente, numa hora má, cair no laço, Deus ainda assim o tirará dele! Ó tu que te desviaste, sê abatido, mas não desesperes. Por mais que tenhas vagado, ouve o que teu Redentor diz: "Voltai, filhos rebeldes; terei misericórdia de vós."

Ainda serás tirado de todo mal em que caíste; aquele que te amou não te rejeitará. Ele te receberá, e te dará alegria e contentamento outra vez.$$),

(25, $$As correntes que se quebram$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Isaías 63:7', $$Mencionarei as bondades do Senhor, e tudo o que ele tem concedido.$$, $$E não podes tu fazer o mesmo? Não há bondades que já experimentaste? Ainda que estejas abatido agora, podes esquecer aquela hora em que foste encontrado e ouviste: "Vem"?

Não podes lembrar aquele momento em que as tuas correntes foram quebradas, os teus grilhões lançados por terra, e ouviste: "Vim para romper os teus laços e te libertar"? Se já esqueceste o amor dos teus primeiros passos, certamente há algum marco precioso ao longo do caminho, onde podes ler um memorial feliz dessa bondade para contigo.

O que já te derrubou antes, e do qual foste restaurado — não é prova de que podes ser restaurado outra vez?$$),

(26, $$Pai$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Mateus 6:26', $$Vosso Pai celestial.$$, $$O povo de Deus é duplamente seu filho: são sua prole pela criação, e são seus filhos por adoção em Cristo. Por isso têm o privilégio de chamá-lo: "Pai nosso, que estás nos céus." Pai! Ó, que palavra preciosa é essa.

Aqui está afeição misturada com autoridade; uma autoridade que não provoca rebeldia; uma obediência que é prestada com a maior alegria. A obediência que os filhos de Deus lhe prestam deve ser uma obediência amorosa — não a de um escravo ao capataz, mas a de quem corre no caminho porque é o caminho do próprio Pai.

Quão grande é o amor de um Pai por seus filhos! Se um pai terreno vela sobre seus filhos com amor e cuidado incessantes, quanto mais o nosso Pai celestial?$$),

(27, $$A plenitude de Cristo$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'João 1:16', $$E da sua plenitude todos nós recebemos.$$, $$Estas palavras nos dizem que há uma plenitude em Cristo. Há uma plenitude de eficácia expiatória em seu sangue, pois "o sangue de Jesus Cristo nos purifica de todo pecado." Há uma plenitude de justiça em sua vida, pois "não há, pois, agora, condenação nenhuma para os que estão em Cristo Jesus."

Há uma plenitude de bênçãos de todo tipo: uma plenitude de graça para perdoar, de graça para regenerar, de graça para santificar, de graça para preservar, e de graça para aperfeiçoar. Há uma plenitude em todos os momentos: de consolo na aflição, de direção na prosperidade.

Vem, crente, e recebe tudo o que precisas; pede com largueza, e receberás com largueza, pois esta "plenitude" é inesgotável, e está guardada em Jesus, Emanuel — Deus conosco.$$),

(28, $$Perfeitos em Cristo$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Colossenses 1:28', $$Perfeitos em Cristo Jesus.$$, $$Não sentes em tua própria alma que a perfeição não está em ti? Cada lágrima que cai dos teus olhos sussurra "imperfeição". Já viste teu próprio coração de perto demais para sonhar, por um momento sequer, com alguma perfeição em ti mesmo.

Mas, em meio a essa triste consciência de imperfeição, aqui está o teu consolo: és "perfeito em Cristo Jesus." Aos olhos de Deus, estás "completo nele"; já agora és "aceito no Amado." Não é encantador olhar adiante, para o tempo em que toda mancha de pecado será removida, e serás apresentado sem falta diante do trono?

Negro como és, um dia serás branco; imundo como és, serás limpo. Cristo toma algo disforme e o faz limpo e incomparável em sua glória.$$),

(29, $$Olhar para frente$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', '2 Coríntios 4:18', $$As coisas que não se veem são eternas.$$, $$Em nossa caminhada, convém, na maior parte do tempo, olhar para frente. Adiante está a meta. Seja para esperança, para alegria ou para consolo, o futuro deve ser o grande objeto dos olhos da fé.

Olhando para o futuro, vemos o que hoje pesa sendo finalmente deixado para trás, a pessoa que queremos ser sendo formada aos poucos, apta a viver uma vida plena. O pensamento desse futuro bem pode aliviar a escuridão do passado e a névoa do presente.

A visão clara da fé há de sustentar-nos até que esta caminhada termine; temores podem afligir e tribulações podem doer, mas, ainda assim, seguimos — um dia de cada vez.$$),

(30, $$O sinal para agir$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', '2 Samuel 5:24', $$Quando ouvires um ruído de marcha pelas copas das amoreiras.$$, $$Os membros da Igreja de Cristo deveriam ser muito dados à oração, sempre buscando a unção do Santo repousar sobre seus corações. Há momentos em que Deus parece favorecer o seu povo de modo especial, e esses momentos deveriam nos deixar duplamente orantes, duplamente sinceros.

Também em ti há momentos assim: tens um poder peculiar na oração; a Escritura se abre para ti; caminhas na luz do rosto de Deus; tens mais proximidade de comunhão com Cristo do que costumavas ter. Nesses períodos alegres é hora de te levantares; agora é hora de te livrares de qualquer hábito mau, enquanto o Espírito de Deus ajuda a tua fraqueza.

Estende a tua vela — mas lembra-te: é o Espírito quem sopra o vento propício. Certifica-te apenas de que a vela está de fato estendida.$$),

(31, $$O Senhor, Justiça Nossa$$, 'Charles H. Spurgeon', 'Manhã e Tarde (tradução livre)', 'Jeremias 23:6', $$O Senhor, Justiça Nossa.$$, $$Sempre dará ao cristão a maior calma pensar na perfeita justiça de Cristo. Quantas vezes os santos de Deus andam abatidos e tristes! Não creio que estariam assim, se pudessem sempre ver a sua perfeição em Cristo.

Há alguns que vivem falando apenas da própria corrupção. Isso é bem verdade, mas por que não ir um pouco além, e lembrar que somos "perfeitos em Cristo Jesus"? Se nos lembrarmos de que "Cristo se fez para nós justiça", teremos bom ânimo.

Ainda que angústias me aflijam, ainda que haja muito a experimentar antes de eu chegar ao céu, tudo isso já foi resolvido por mim na aliança da graça divina; nada falta em meu Senhor, Cristo já fez tudo. Na cruz ele disse: "Está consumado!" — e se está consumado, então estou completo nele.$$)

on conflict (day_index) do update set
  title = excluded.title,
  author = excluded.author,
  source = excluded.source,
  scripture_ref = excluded.scripture_ref,
  scripture_text = excluded.scripture_text,
  body = excluded.body;
