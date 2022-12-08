module UsersHelper

    def convert_role_to_s(role)
        roles={"admin" => "Administrador","staff"=> "Personal Bancario","client" => "Cliente"}
        roles[role]
    end
end
