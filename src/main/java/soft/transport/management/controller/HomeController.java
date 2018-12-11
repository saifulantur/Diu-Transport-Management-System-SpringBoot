package soft.transport.management.controller;


import soft.transport.management.serviceImpl.UsersServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;


@Controller
public class HomeController {

    @Autowired
    UsersServiceImpl usersService;

    @RequestMapping("/")
    public String viewHome() {

        return "app.homepage";
    }

    @GetMapping("/index")
    public String userIndex() {
        return "index";
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/home")
    public String showHome() {
        return "home";
    }
    
    @RequestMapping("/test")
    public String showTest() {
        return "test";
    }
    
    @RequestMapping("/test1")
    public String showTest1() {
        return "test1";
    }
    
    @RequestMapping("/driver")
    public String driverInfo() {
        return "driver";
    }

/*    @GetMapping("/access-denied")
    public String accessDenied() {
        return "/error/access-denied";
    }

    @PostMapping("/user/add")
    @ResponseBody
    public String addUser(@RequestBody User user){
        usersService.addUser(user);
        return "Successfully Saved";
    }

    @PostMapping("/user/showall")
    @ResponseBody
    public List<User> getUsers(){
        return usersService.getAllUsers();
    } */
}
