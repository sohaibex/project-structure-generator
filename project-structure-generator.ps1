function Show-Menu {
    param (
        [string]$Title = 'Select an Architecture'
    )
    Clear-Host
    Write-Host "================ $Title ================"
    Write-Host "1: Layered Architecture"
    Write-Host "2: Clean Architecture"
    Write-Host "3: Microservices Architecture"
    Write-Host "4: Event-Driven Architecture"
    Write-Host "5: Custom Architecture (from filearchitecture.config)"
    Write-Host "Q: Quit"
}

function Create-Directory {
    param (
        [string]$Path
    )
    if (!(Test-Path $Path)) {
        New-Item -ItemType Directory -Path $Path | Out-Null
    }
}

function Create-File {
    param (
        [string]$Path,
        [string]$Content = ""
    )
    if (!(Test-Path $Path)) {
        New-Item -ItemType File -Path $Path | Out-Null
        if ($Content -ne "") {
            Set-Content -Path $Path -Value $Content
        }
    }
}

function Generate-LayeredArchitecture {
    param (
        [string]$ProjectName
    )
    $root = $ProjectName
    Create-Directory $root
    Create-Directory "$root\presentation"
    Create-Directory "$root\business_logic"
    Create-Directory "$root\data_access"
    Create-Directory "$root\tests"

    Create-File "$root\presentation\__init__.py"
    Create-File "$root\presentation\views.py"
    Create-File "$root\business_logic\__init__.py"
    Create-File "$root\business_logic\services.py"
    Create-File "$root\business_logic\models.py"
    Create-File "$root\data_access\__init__.py"
    Create-File "$root\data_access\repository.py"
    Create-File "$root\tests\__init__.py"
    Create-File "$root\tests\test_services.py"
    Create-File "$root\config.py"
    Create-File "$root\main.py"
    Create-File "$root\requirements.txt"

    $readmeContent = @"
# $ProjectName - Layered Architecture

This project follows a Layered Architecture pattern.

## Structure:
- presentation/: User interface and API endpoints
- business_logic/: Business rules and logic
- data_access/: Data persistence and retrieval
- tests/: Unit and integration tests

## Getting Started:
1. Install dependencies: `pip install -r requirements.txt`
2. Run the application: `python main.py`

## Extending the Project:
- Add new views in `presentation/views.py`
- Implement business logic in `business_logic/services.py`
- Define data models in `business_logic/models.py`
- Add data access methods in `data_access/repository.py`
- Write tests in the `tests/` directory
"@
    Create-File "$root\README.md" $readmeContent
}

function Generate-CleanArchitecture {
    param (
        [string]$ProjectName
    )
    $root = $ProjectName
    Create-Directory $root
    Create-Directory "$root\domain"
    Create-Directory "$root\application"
    Create-Directory "$root\infrastructure"
    Create-Directory "$root\infrastructure\persistence"
    Create-Directory "$root\infrastructure\api"
    Create-Directory "$root\tests"

    Create-File "$root\domain\__init__.py"
    Create-File "$root\domain\entities.py"
    Create-File "$root\application\__init__.py"
    Create-File "$root\application\use_cases.py"
    Create-File "$root\infrastructure\__init__.py"
    Create-File "$root\infrastructure\persistence\__init__.py"
    Create-File "$root\infrastructure\persistence\repositories.py"
    Create-File "$root\infrastructure\api\__init__.py"
    Create-File "$root\infrastructure\api\controllers.py"
    Create-File "$root\tests\__init__.py"
    Create-File "$root\tests\test_use_cases.py"
    Create-File "$root\config.py"
    Create-File "$root\main.py"
    Create-File "$root\requirements.txt"

    $readmeContent = @"
# $ProjectName - Clean Architecture

This project follows the Clean Architecture pattern.

## Structure:
- domain/: Enterprise business rules and entities
- application/: Application-specific business rules
- infrastructure/: Frameworks, drivers, and tools
- tests/: Unit and integration tests

## Getting Started:
1. Install dependencies: `pip install -r requirements.txt`
2. Run the application: `python main.py`

## Extending the Project:
- Define core entities in `domain/entities.py`
- Implement use cases in `application/use_cases.py`
- Add data persistence in `infrastructure/persistence/repositories.py`
- Implement API controllers in `infrastructure/api/controllers.py`
- Write tests in the `tests/` directory
"@
    Create-File "$root\README.md" $readmeContent
}

function Generate-MicroservicesArchitecture {
    param (
        [string]$ProjectName
    )
    $root = $ProjectName
    Create-Directory $root
    Create-Directory "$root\service1"
    Create-Directory "$root\service2"
    Create-Directory "$root\api_gateway"

    foreach ($service in @("service1", "service2")) {
        Create-Directory "$root\$service\src"
        Create-Directory "$root\$service\tests"
        Create-File "$root\$service\src\__init__.py"
        Create-File "$root\$service\src\main.py"
        Create-File "$root\$service\tests\__init__.py"
        Create-File "$root\$service\tests\test_main.py"
        Create-File "$root\$service\Dockerfile"
        Create-File "$root\$service\requirements.txt"
    }

    Create-Directory "$root\api_gateway\src"
    Create-File "$root\api_gateway\src\__init__.py"
    Create-File "$root\api_gateway\src\main.py"
    Create-File "$root\api_gateway\Dockerfile"
    Create-File "$root\api_gateway\requirements.txt"

    Create-File "$root\docker-compose.yml"

    $readmeContent = @"
# $ProjectName - Microservices Architecture

This project follows a Microservices Architecture pattern.

## Structure:
- service1/: First microservice
- service2/: Second microservice
- api_gateway/: API Gateway for routing requests

## Getting Started:
1. Install Docker and Docker Compose
2. Run `docker-compose up --build` in the root directory

## Extending the Project:
- Add new services by creating new directories with a similar structure to existing services
- Implement service-specific logic in `serviceX/src/main.py`
- Add new endpoints to the API Gateway in `api_gateway/src/main.py`
- Update `docker-compose.yml` when adding new services
"@
    Create-File "$root\README.md" $readmeContent
}

function Generate-EventDrivenArchitecture {
    param (
        [string]$ProjectName
    )
    $root = $ProjectName
    Create-Directory $root
    Create-Directory "$root\events"
    Create-Directory "$root\handlers"
    Create-Directory "$root\services"
    Create-Directory "$root\tests"

    Create-File "$root\events\__init__.py"
    Create-File "$root\events\event_definitions.py"
    Create-File "$root\handlers\__init__.py"
    Create-File "$root\handlers\event_handlers.py"
    Create-File "$root\services\__init__.py"
    Create-File "$root\services\event_bus.py"
    Create-File "$root\services\event_store.py"
    Create-File "$root\tests\__init__.py"
    Create-File "$root\tests\test_handlers.py"
    Create-File "$root\main.py"
    Create-File "$root\requirements.txt"

    $readmeContent = @"
# $ProjectName - Event-Driven Architecture

This project follows an Event-Driven Architecture pattern.

## Structure:
- events/: Event definitions
- handlers/: Event handlers
- services/: Core services (event bus, event store)
- tests/: Unit and integration tests

## Getting Started:
1. Install dependencies: `pip install -r requirements.txt`
2. Run the application: `python main.py`

## Extending the Project:
- Define new events in `events/event_definitions.py`
- Implement event handlers in `handlers/event_handlers.py`
- Extend the event bus or event store in the `services/` directory
- Write tests for new handlers and events in the `tests/` directory
"@
    Create-File "$root\README.md" $readmeContent
}

function Parse-CustomStructure {
    param (
        [string]$FilePath
    )
    $content = Get-Content $FilePath -Raw
    $lines = $content -split "`r?`n"
    $root = $lines[0].Trim().TrimEnd('/')
    $structure = @{}
    $currentPath = @()

    foreach ($line in $lines[1..$lines.Count]) {
        if ($line -match '^\s*$') { continue }
        $level = ($line -replace '^(\s*).*', '$1').Length / 2
        $item = $line.Trim()
        
        while ($currentPath.Count -gt $level) {
            $currentPath = $currentPath[0..($currentPath.Count - 2)]
        }
        
        if ($item.EndsWith('/')) {
            $currentPath = $currentPath + $item.TrimEnd('/')
            $structure[$currentPath -join '/'] = @()
        } else {
            $structure[($currentPath -join '/')] += $item
        }
    }
    
    return @{Root = $root; Structure = $structure}
}

function Generate-CustomArchitecture {
    param (
        [string]$ProjectName,
        [hashtable]$ParsedStructure
    )
    if ($ParsedStructure.Root -eq $ProjectName) {
        $root = $ProjectName
    } else {
        $root = Join-Path $ProjectName $ParsedStructure.Root
    }
    Create-Directory $root

    foreach ($dir in $ParsedStructure.Structure.Keys) {
        $path = Join-Path $root $dir
        Create-Directory $path
        foreach ($file in $ParsedStructure.Structure[$dir]) {
            Create-File (Join-Path $path $file)
        }
    }

    $readmeContent = @"
# $ProjectName - Custom Architecture

This project follows a custom architecture pattern.

## Structure:
$($ParsedStructure.Structure.Keys | ForEach-Object { "- $_/" })

## Getting Started:
1. Install dependencies: `pip install -r requirements.txt`
2. Run the application: `python main.py`

## Extending the Project:
- Refer to the structure above to understand where to add new components
- Ensure to maintain the established architecture pattern when adding new features
"@
    Create-File "$root\README.md" $readmeContent
}

# Main script
$projectName = Read-Host -Prompt 'Enter your project name'

do {
    Show-Menu
    $selection = Read-Host "Please make a selection"
    switch ($selection) {
        '1' {
            Generate-LayeredArchitecture -ProjectName $projectName
            Write-Host "Layered Architecture project structure created successfully!"
        }
        '2' {
            Generate-CleanArchitecture -ProjectName $projectName
            Write-Host "Clean Architecture project structure created successfully!"
        }
        '3' {
            Generate-MicroservicesArchitecture -ProjectName $projectName
            Write-Host "Microservices Architecture project structure created successfully!"
        }
        '4' {
            Generate-EventDrivenArchitecture -ProjectName $projectName
            Write-Host "Event-Driven Architecture project structure created successfully!"
        }
        '5' {
            $configFile = "filearchitecture.config"
            if (Test-Path $configFile) {
                $parsedStructure = Parse-CustomStructure $configFile
                Generate-CustomArchitecture -ProjectName $projectName -ParsedStructure $parsedStructure
                Write-Host "Custom Architecture project structure created successfully!"
            } else {
                Write-Host "Error: filearchitecture.config not found in the current directory."
                Write-Host @"
Please create a file named 'filearchitecture.config' with your custom architecture structure.
Use indentation (2 spaces) to indicate nesting.
End folder names with a forward slash (/).
Example content of filearchitecture.config:
trading_bot/
  config/
    __init__.py
    config.py
  core/
    __init__.py
    data_fetcher.py
  main.py
  requirements.txt
"@
            }
        }
    }
    pause
}
until ($selection -eq 'q')