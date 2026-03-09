<!DOCTYPE html>
<html class="light" lang="en">

<head>
    <meta charset="utf-8" />
    <meta content="width=device-width, initial-scale=1.0" name="viewport" />
    <title>Currency Converter Dashboard</title>
        <link rel="icon" href="data:,">
    
    <!-- Tailwind CSS -->
    <script src="https://cdn.tailwindcss.com?plugins=forms,container-queries"></script>
    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com" rel="preconnect" />
    <link crossorigin="" href="https://fonts.gstatic.com" rel="preconnect" />
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700&amp;display=swap"
        rel="stylesheet" />
    <!-- Material Symbols -->
    <link
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
        rel="stylesheet" />
    <link
        href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:wght,FILL@100..700,0..1&amp;display=swap"
        rel="stylesheet" />
    <script id="tailwind-config">
        tailwind.config = {
            darkMode: "class",
            theme: {
                extend: {
                    colors: {
                        "primary": "#137fec",
                        "background-light": "#f6f7f8",
                        "background-dark": "#101922",
                    },
                    fontFamily: {
                        "display": ["Inter", "sans-serif"]
                    },
                    borderRadius: {
                        "DEFAULT": "0.25rem",
                        "lg": "0.5rem",
                        "xl": "0.75rem",
                        "full": "9999px"
                    },
                },
            },
        }
    </script>
    <style>
        body {
            font-family: "Inter", sans-serif
        }

        .select-custom {
            appearance: none;
            background-image: url(https://lh3.googleusercontent.com/aida-public/AB6AXuDulU4UbrzoSQD7qyzxpzZeS3uHeTXvOiasnzahYvLxhDIw4y1KcdZ9Z3EihkNwlnozIRSIo9if1O7T3zoVq6zs9qWAmEISvSzjCgtchbcEucS2Utp30mFdU-PzGtjqStcWOfLNl_VGtwUXCSQSccr0NyD1R4aqR1ex0QswikqTooXGHy-E6Yt7i7PgHkAGuV4i4QL9iORKhyF1c-bdEWsZ7mlai1dZ7vxxeSzDTA3yeCayiKr8cC_owrnH87fFeGK4B6vYLL75zw);
            background-position: right 0.5rem center;
            background-repeat: no-repeat;
            background-size: 1.5em 1.5em
        }
    </style>
</head>

<body class="bg-background-light dark:bg-background-dark min-h-screen font-display transition-colors duration-200">
    <div class="flex flex-col min-h-screen">
        <!-- Top Navigation Bar -->
        <header
            class="w-full bg-white dark:bg-background-dark/50 border-b border-gray-200 dark:border-gray-800 px-6 py-4">
            <div class="max-w-7xl mx-auto flex items-center justify-between">
                <div class="flex items-center gap-3">
                    <div class="text-primary">
                        <svg class="size-8" fill="none" viewbox="0 0 48 48" xmlns="http://www.w3.org/2000/svg">
                            <path clip-rule="evenodd"
                                d="M24 18.4228L42 11.475V34.3663C42 34.7796 41.7457 35.1504 41.3601 35.2992L24 42V18.4228Z"
                                fill="currentColor" fill-rule="evenodd"></path>
                            <path clip-rule="evenodd"
                                d="M24 8.18819L33.4123 11.574L24 15.2071L14.5877 11.574L24 8.18819ZM9 15.8487L21 20.4805V37.6263L9 32.9945V15.8487ZM27 37.6263V20.4805L39 15.8487V32.9945L27 37.6263ZM25.354 2.29885C24.4788 1.98402 23.5212 1.98402 22.646 2.29885L4.98454 8.65208C3.7939 9.08038 3 10.2097 3 11.475V34.3663C3 36.0196 4.01719 37.5026 5.55962 38.098L22.9197 44.7987C23.6149 45.0671 24.3851 45.0671 25.0803 44.7987L42.4404 38.098C43.9828 37.5026 45 36.0196 45 34.3663V11.475C45 10.2097 44.2061 9.08038 43.0155 8.65208L25.354 2.29885Z"
                                fill="currentColor" fill-rule="evenodd"></path>
                        </svg>
                    </div>
                    <span class="text-xl font-bold text-gray-900 dark:text-white">D_27</span>
                </div>

            </div>
        </header>
        <!-- Main Content -->
        <main class="flex-1 flex flex-col items-center justify-center px-4 py-12">
            <!-- Headline Section -->
            <div class="text-center mb-8">
                <h1 class="text-gray-900 dark:text-white text-3xl md:text-4xl font-extrabold tracking-tight mb-3">
                    Currency Converter</h1>
                <p class="text-gray-500 dark:text-gray-400 text-lg">Fast, reliable, and real-time exchange rates.</p>
            </div>
            <!-- Converter Card -->
            <div
                class="w-full max-w-[500px] bg-white dark:bg-gray-900 rounded-xl shadow-xl dark:shadow-2xl p-8 border border-gray-100 dark:border-gray-800">
                <!-- Card Hero Image (Optional Subtle Visual) -->

                <form action="CurrencyServlet" method="post" class="space-y-6">
                    <!-- Amount Input -->
                    <div>
                        <label class="block text-sm font-semibold text-gray-700 dark:text-gray-300 mb-2">Amount</label>
                        <div class="relative">
                            <span class="absolute left-4 top-1/2 -translate-y-1/2 text-gray-400">
                                <span class="material-symbols-outlined text-lg">payments</span>
                            </span>
                            <input name="amount" value="${amount}"
                                class="w-full pl-11 pr-4 h-14 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 rounded-lg text-gray-900 dark:text-white focus:ring-2 focus:ring-primary focus:border-transparent transition-all outline-none text-lg"
                                placeholder="1,000.00" step="0.01" type="number" />
                        </div>
                    </div>
                    <!-- Currency Selectors -->
                    <div class="grid grid-cols-1 md:grid-cols-[1fr_auto_1fr] items-center gap-4">
                        <div class="w-full">
                            <label
                                class="block text-sm font-semibold text-gray-700 dark:text-gray-300 mb-2">From</label>
                            <select name="from"
                                class="select-custom w-full h-14 px-4 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 rounded-lg text-gray-900 dark:text-white focus:ring-2 focus:ring-primary focus:border-transparent outline-none">
                                <option value="USD" ${from=='USD' ? 'selected' : ''}>USD - US Dollar</option>
								<option value="EUR" ${from=='EUR' ? 'selected' : ''}>EUR - Euro</option>
								<option value="INR" ${from=='INR' ? 'selected' : ''}>INR - Indian Rupee</option>
								<option value="GBP" ${from=='GBP' ? 'selected' : ''}>GBP - British Pound</option>
								<option value="AUD" ${from=='AUD' ? 'selected' : ''}>AUD - Australian Dollar</option>
								<option value="CAD" ${from=='CAD' ? 'selected' : ''}>CAD - Canadian Dollar</option>
								<option value="JPY" ${from=='JPY' ? 'selected' : ''}>JPY - Japanese Yen</option>
								<option value="CNY" ${from=='CNY' ? 'selected' : ''}>CNY - Chinese Yuan</option>
								<option value="CHF" ${from=='CHF' ? 'selected' : ''}>CHF - Swiss Franc</option>
								</select>
                        </div>
                        <div class="flex justify-center pt-6">
                            <div
                                class="w-10 h-10 rounded-full bg-gray-50 dark:bg-gray-800 flex items-center justify-center border border-gray-200 dark:border-gray-700 cursor-pointer hover:bg-gray-100 dark:hover:bg-gray-700 transition-colors">
                                <span class="material-symbols-outlined text-gray-500">swap_horiz</span>
                            </div>
                        </div>
                        <div class="w-full">
                            <label class="block text-sm font-semibold text-gray-700 dark:text-gray-300 mb-2">To</label>
                            <select name="to"
                                class="select-custom w-full h-14 px-4 bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 rounded-lg text-gray-900 dark:text-white focus:ring-2 focus:ring-primary focus:border-transparent outline-none">
                                <option value="USD" ${to=='USD' ? 'selected' : ''}>USD - US Dollar</option>
								<option value="EUR" ${to=='EUR' ? 'selected' : ''}>EUR - Euro</option>
								<option value="INR" ${to=='INR' ? 'selected' : ''}>INR - Indian Rupee</option>
								<option value="GBP" ${to=='GBP' ? 'selected' : ''}>GBP - British Pound</option>
								<option value="AUD" ${to=='AUD' ? 'selected' : ''}>AUD - Australian Dollar</option>
								<option value="CAD" ${to=='CAD' ? 'selected' : ''}>CAD - Canadian Dollar</option>
								<option value="JPY" ${to=='JPY' ? 'selected' : ''}>JPY - Japanese Yen</option>
								<option value="CNY" ${to=='CNY' ? 'selected' : ''}>CNY - Chinese Yuan</option>
								<option value="CHF" ${to=='CHF' ? 'selected' : ''}>CHF - Swiss Franc</option>
								 </select>
                        </div>
                    </div>
                    <!-- Result (Subtle state before conversion) -->
                    <div class="p-4 bg-primary/5 dark:bg-primary/10 rounded-lg border border-primary/20 text-center">
                        <p class="text-xs font-medium text-gray-500 dark:text-gray-400 uppercase tracking-wider mb-1">
                            Exchange Rate</p>
                        <p class="text-lg font-bold text-primary">
                            ${result != null ? result : 'Enter details and click Convert'}
                        </p>
                    </div>
                    <!-- Convert Button -->
                    <button type="submit"
                        class="w-full bg-primary hover:bg-primary/90 text-white font-bold h-14 rounded-lg shadow-lg shadow-primary/20 transition-all flex items-center justify-center gap-2 group">
                        <span>Convert Now</span>
                        <span
                            class="material-symbols-outlined group-hover:translate-x-1 transition-transform">trending_flat</span>
                    </button>
                    <div class="text-center">
					    <a href="exportHistory" class="text-sm text-blue-600 underline">
					        Download 2026 JAN -> Today (CSV)
					    </a>
					    <p class="text-lg font-bold text-primary">
                            Note* 
                        </p>
                        <p class="text-lg font-bold text-primary">
                            DATA will only shows WEEKDAY
                        </p>
					</div>
                    
                    <!-- Info Footer -->

                    
                    <div class="text-center pt-2">
                        <p class="text-[11px] text-gray-400 dark:text-gray-500 italic">
                            Rates are for informational purposes only. Last updated 2 minutes ago.
                        </p>
                    </div>
                </form>
            </div>
            <!-- Additional Dashboard Stats (Minimalist Style) -->
           <!--   <div class="mt-12 grid grid-cols-1 md:grid-cols-3 gap-6 w-full max-w-[960px] px-4">
                <div
                    class="flex items-center gap-4 p-4 rounded-xl bg-white/50 dark:bg-gray-900/50 border border-white dark:border-gray-800 backdrop-blur-sm">
                    <div
                        class="size-10 rounded-lg bg-green-100 dark:bg-green-900/30 flex items-center justify-center text-green-600">
                        <span class="material-symbols-outlined">trending_up</span>
                    </div>
                    <div>
                        <p class="text-xs text-gray-500">EUR/USD High</p>
                        <p class="font-bold text-gray-900 dark:text-white">${eurUsdHigh}</p>
                    </div>
                </div>
                <div
                    class="flex items-center gap-4 p-4 rounded-xl bg-white/50 dark:bg-gray-900/50 border border-white dark:border-gray-800 backdrop-blur-sm">
                    <div
                        class="size-10 rounded-lg bg-blue-100 dark:bg-blue-900/30 flex items-center justify-center text-blue-600">
                        <span class="material-symbols-outlined">query_stats</span>
                    </div>
                    <div>
                        <p class="text-xs text-gray-500">Market Volatility</p>
                        <p class="font-bold text-gray-900 dark:text-white">${volatility}</p>
                    </div>
                </div>
                <div
                    class="flex items-center gap-4 p-4 rounded-xl bg-white/50 dark:bg-gray-900/50 border border-white dark:border-gray-800 backdrop-blur-sm">
                    <div
                        class="size-10 rounded-lg bg-orange-100 dark:bg-orange-900/30 flex items-center justify-center text-orange-600">
                        <span class="material-symbols-outlined">timer</span>
                    </div>
                    <div>
                        <p class="text-xs text-gray-500">Next Update In</p>
                        <p class="font-bold text-gray-900 dark:text-white">${nextUpdate}</p>
                    </div>
                </div>
            </div>-->
        </main>
        <!-- Footer -->
        <footer class="w-full py-6 px-10 border-t border-gray-200 dark:border-gray-800 text-center">
    <p class="text-sm text-gray-500 dark:text-gray-400">
        © 2026 RN:68/69 Smit Patil / Shirin Shaikh Currency Converter 
    </p>
</footer>

    </div>
</body>

</html>