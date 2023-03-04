//
//  GatitosViewController.swift
//  TheCatAPI
//
//  Created by John on 30/10/22.
//

import UIKit

class GatitosViewController: UIViewController {
    
    // MARK: - Properties
    let viewModel: GatitosViewModelProtocol
    
    // translateMask setado com falso Permite ajustar constraints manualmente
    private let tableView = UITableView(translateMask: false).apply {
        $0.separatorStyle = .none // Seperador de Linhas, neste caso, náo temos
        $0.backgroundColor = .clear
        $0.allowsSelection = true // Permite que a célula seja selecionada
        $0.bounces = true // Permite um efeito suave no scroll da lista
        $0.showsVerticalScrollIndicator = false // Oculta a barra de rolagem ao scrollar
    }

    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        setupBind()
    }
    
    // Inicializa a ViewModel quando essa controller for chamada
    init(viewModel: GatitosViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Helpers
    func setupBind() {
        viewModel.breedsArray.bind { breeds in
            self.tableView.reloadData()
        }
    }
}

// MARK: - CodeView
extension GatitosViewController: CodeView {
    func buildViewHierarchy() {
        view.addSubview(tableView)
    }
    
    func setupConstraints() {
        tableView.anchor(
            top: view.safeAreaLayoutGuide.topAnchor,
            left: view.leftAnchor,
            bottom: view.bottomAnchor,
            right: view.rightAnchor,
            paddingLeft: 16,
            paddingRight: 16
        )
    }
    
    func setupAdditionalConfiguration() {
        view.backgroundColor = .white
        title = "Raças"
        tableView.register(GatitosViewCell.self, forCellReuseIdentifier: "GatitosViewCell")
        tableView.delegate = self
        tableView.dataSource = self
    }
}

// MARK: - UITableViewDelegate, UITableViewDataSource
extension GatitosViewController: UITableViewDelegate, UITableViewDataSource {
    // Quantidade de seções
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    // Numero de linhas dentro da Seção
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.breedsArray.value.count
    }
    
    // Altura da célula
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    // Costumiza a tableView como um todo
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {

        // Este trecho de código faz com que cada célula tenha um espaçamento entre elas
        // ---------------------------------------------------------------------------------
        let verticalPadding: CGFloat = 8
        let maskLayer = CALayer()
        maskLayer.cornerRadius = 4 // Bordar arredondadas
        maskLayer.backgroundColor = UIColor.black.cgColor
        maskLayer.frame = CGRect(
            x: cell.bounds.origin.x,
            y: cell.bounds.origin.y,
            width: cell.bounds.width,
            height: cell.bounds.height
        ).insetBy(
            dx: 0,
            dy: verticalPadding/2
        )
        cell.layer.mask = maskLayer
        // ---------------------------------------------------------------------------------
    }
    
    // tabbleView sendo configurada para se comportar como a celula que criamos
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GatitosViewCell", for: indexPath) as! GatitosViewCell
        cell.label.text = viewModel.breedsArray.value[indexPath.row].name
        return cell
    }
    
    // Configura a função do clique das células.
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let object = viewModel.breedsArray.value[indexPath.row]
        let viewModel = GatitosDetailsViewModel(object: object)
        let controller = GatitosDetailsViewController(viewModel: viewModel)
        navigationController?.pushViewController(controller, animated: true)
    }
}
