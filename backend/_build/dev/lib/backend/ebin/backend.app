{application,backend,
             [{applications,[kernel,stdlib,elixir,logger,runtime_tools,
                             gettext,telemetry_metrics,telemetry_poller,jason,
                             postgrex,ecto_sql,plug_cowboy,phoenix,
                             phoenix_live_dashboard,phoenix_ecto]},
              {description,"backend"},
              {modules,['Elixir.Backend','Elixir.Backend.Accounts',
                        'Elixir.Backend.Accounts.Order',
                        'Elixir.Backend.Accounts.User',
                        'Elixir.Backend.Application','Elixir.Backend.Repo',
                        'Elixir.Backend.Stores',
                        'Elixir.Backend.Stores.Product','Elixir.BackendWeb',
                        'Elixir.BackendWeb.ChangesetView',
                        'Elixir.BackendWeb.Endpoint',
                        'Elixir.BackendWeb.ErrorHelpers',
                        'Elixir.BackendWeb.ErrorView',
                        'Elixir.BackendWeb.FallbackController',
                        'Elixir.BackendWeb.Gettext',
                        'Elixir.BackendWeb.OrderController',
                        'Elixir.BackendWeb.OrderView',
                        'Elixir.BackendWeb.ProductController',
                        'Elixir.BackendWeb.ProductView',
                        'Elixir.BackendWeb.Router',
                        'Elixir.BackendWeb.Router.Helpers',
                        'Elixir.BackendWeb.Telemetry',
                        'Elixir.BackendWeb.UserController',
                        'Elixir.BackendWeb.UserSocket',
                        'Elixir.BackendWeb.UserView',
                        'Elixir.Jason.Encoder.Backend.Accounts.Order',
                        'Elixir.Jason.Encoder.Backend.Accounts.User',
                        'Elixir.Jason.Encoder.Backend.Stores.Product']},
              {registered,[]},
              {vsn,"0.1.0"},
              {mod,{'Elixir.Backend.Application',[]}}]}.
