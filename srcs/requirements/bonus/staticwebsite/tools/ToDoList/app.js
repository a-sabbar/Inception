const delet = document.querySelector(".delete");
const search = document.querySelector(".search");
const addForm = document.querySelector(".add");
const todos = document.querySelector(".todos");
const className = "list-group-item d-flex justify-content-between align-content-center";


const createNewTodo = todo=>{
    const html = `
    <li class="${className}">
    <span>${todo}</span>
    <i class="far fa-trash-alt delete"></i>
  </li>
    `
    return html;
}

addForm.addEventListener("submit", e =>{
    e.preventDefault();
    const todo = String(addForm.add.value);
    if(todo.length)
    {
        todo.trim();
        todos.innerHTML += createNewTodo(todo);
        addForm.reset();
    }
});

todos.addEventListener("click", e =>{
    if(e.target.classList.contains("delete"))
        e.target.parentElement.remove();
});



const filterTodos = term =>{
    Array.from(todos.children).filter(elm => !elm.textContent.includes(term)).forEach(todo=>{
        todo.classList.add("filted");
    });
    Array.from(todos.children).filter(elm => elm.textContent.includes(term)).forEach(todo=>{
        todo.classList.remove("filted");
    });
};

search.addEventListener("keyup", e =>{
    e.preventDefault();
    const term = search.search.value.trim();
    filterTodos(term);
});