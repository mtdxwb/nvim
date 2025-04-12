![mtdxwb's nvim config](https://readme-typing-svg.demolab.com?font=Fira+Code&size=30&pause=1000&color=000000&vCenter=true&width=435&height=45&lines=NVIM+YES)

---

## 如何使用
1. 将旧配置重命名
    ```plaintext
    cd ~/.config
    mv ./nvim nvim.old
    ```
2. 将项目clone至 ~/.config/nvim 目录中(注意备份好自己的配置)  
    ```plaintext
    cd ~/.config
    git clone https://github.com/yaocccc/nvim
    ```
3. 启动nvim，等待插件安装好(插件管理器: lazy.nvim)

4. 开始自己使用吧！！！

## 目录结构
```dir
.
├── .luarc.json                     -- lua对nvimapi的支持
├── init.lua                        -- 配置入口文件
├── README.md                       -- REMADME
└── lua                             -- lua目录(配置目录)
    ├── core                        -- 核心配置目录
    │   ├── defaults.lua            -- vim基础配置文件
    │   ├── keymaps.lua             -- 键位映射配置文件
    │   └── lazy.lua                -- lazy插件管理配置文件
    └── plugins                     -- 插件目录
        ├── configs                 -- 特定插件配置目录
        │   └── ...(other files)
        └── ...(other files)
```
