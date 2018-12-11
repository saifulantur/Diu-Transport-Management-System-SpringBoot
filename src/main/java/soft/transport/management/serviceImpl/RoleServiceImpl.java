package soft.transport.management.serviceImpl;

import soft.transport.management.model.Role;
import soft.transport.management.model.User;
import soft.transport.management.repository.RoleRepository;
import soft.transport.management.service.RoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RoleServiceImpl implements RoleService {

    @Autowired
    private RoleRepository roleRepository;

    @Override
    public void addRole(Role role) {
        roleRepository.save(role);
    }

    @Override
    public void updateRole(Role role) {
        roleRepository.save(role);
    }

    @Override
    public Role getRole(Long id) {
        return roleRepository.getOne(id);
    }

    @Override
    public List<Role> getRoleByUser(User user) {
        return roleRepository.findRolesByUserList(user);
    }
}
