package kr.co.bluezine;

import java.util.List;

import kr.co.bluezine.dao.User;
import kr.co.bluezine.service.UserService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/main.do")
public class RestControl {

	@Autowired
    @Qualifier("UserServiceImpl")
    private UserService userService;
    
    @RequestMapping(method=RequestMethod.GET)
    public List<User> getUsers() {
    	return userService.getUsers();
    }
    
    @RequestMapping(value="/{id}", method=RequestMethod.GET)
    public User getUSer(@PathVariable String id) {
    	return userService.getUser(id);
    }
    
    @RequestMapping(method=RequestMethod.POST)
    public User insert(@RequestBody User user) {
    	userService.insertUser(user);
    	return userService.getUser(user.getId());
    }
    
    @RequestMapping(method=RequestMethod.PUT)
    public void update(@RequestBody User user) {
    	userService.updateUser(user);
    }
    
    @RequestMapping(method=RequestMethod.DELETE)
    public void delete(@RequestBody User user) {
    	userService.deleteUser(user);
    }
}
