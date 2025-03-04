const UserModel = require('../models/UserModel');

class UserController {
  async getAll(req, res) {
    const users = await UserModel.findAll();
    res.json(users);
  }

  async getById(req, res) {
    const id = req.params.id;
    const user = await UserModel.findById(id);
    res.json(user);
  }

  async create(req, res) {
    const user = await UserModel.create(req.body);
    res.json(user);
  }

  async update(req, res) {
    const id = req.params.id;
    const user = await UserModel.update(id, req.body);
    res.json(user);
  }

  async delete(req, res) {
    const id = req.params.id;
    await UserModel.delete(id);
    res.json({ message: 'Usuário deletado com sucesso' });
  }
}

module.exports = UserController;